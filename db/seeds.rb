DATA = {:day_keys => ['name'],
        :days => [['Monday'], ['Tuesday'], ['Wednesday'], ['Thursday'], ['Friday'], ['Saturday'], ['Sunday']],
    :user_keys => ['username', 'name', 'password'],
        :users => [['batsaikhan84', 'Batsaikhan Ulambayar', 'password'], ['sugarmaa89', 'Sugarmaa Dorjdagva', 'password']],
    :exercise_keys => ['name', 'calorie', 'note'],
        :exercises => [['Burpee', 300, 'exercise duration is 10 min'], ['Plank', 300, 'exercise duration is 10 min'], ['Squat', 400, 'exercise set 3 reps 10']]
}

def main
    make_exercises
    make_days
    make_users
    
    
end

def make_days
    DATA[:days].each do |day|
      new_day = Day.new
      day.each_with_index do |attribute, i|
        new_day.send(DATA[:day_keys][i]+"=", attribute)
      end
      new_day.save
    end
  end

  def make_users
    DATA[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
  end

  def make_exercises
    DATA[:exercises].each do |exercise|
      new_exercise = Exercise.new
      exercise.each_with_index do |attribute, i|
        new_exercise.send(DATA[:exercise_keys][i]+"=", attribute)
      end
      new_exercise.save
    end
  end

  main
