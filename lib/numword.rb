class Fixnum
  define_method(:hundreds) do
    num_int = self
    num_string = self.to_s
    num_int_array = []
    num_array = num_string.split(//)
    num_array.each() do |n|
      num_int_array.push(n.to_i)
    end

    low_num_hash = {
      0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five",
      6=>"six", 7=>"seven", 8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve",
      13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen",
      18=>"eighteen", 19=>"nineteen"
    }

    tens_num_hash = { 2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety" }

    if num_int < 20
      word = low_num_hash.fetch(num_int)
    elsif num_int < 100 #num between 20 and 99
      word = tens_num_hash.fetch(num_int_array[0]) + " " + low_num_hash.fetch(num_int_array[1])
    else #hundreds
      word = low_num_hash.fetch(num_int_array[0]) + " hundred "
      num_int_array.shift() #remove hundreds digit from array
      last_two_digits = num_int_array.join().to_i
      if last_two_digits < 20
        word = word + low_num_hash.fetch(last_two_digits)
      else
        word = word + tens_num_hash.fetch(num_int_array[0]) + " " + low_num_hash.fetch(num_int_array[1])
      end
    end

    split_word = word.split(" ")
    split_word.delete("zero")
    return split_word.join(" ")

  end
end

class String
  define_method(:numword) do
    num_int = self.to_i
    num_int_array = []
    num_array = self.split(//)
    num_array.each() do |n|
      num_int_array.push(n.to_i)
    end
    len = num_int_array.length

    if num_int == 0
      word = "zero"
    elsif len <= 3
      word = num_int.hundreds()
    elsif len == 4 || len == 5 || len == 6
      hundreds_array = num_int_array.pop(3)
      hundreds_int = hundreds_array.join().to_i
      thousands_int = num_int_array.join().to_i
      if hundreds_int == 0
        word = thousands_int.hundreds() + " thousand"
      else
        word = thousands_int.hundreds() + " thousand " + hundreds_int.hundreds()
      end
    elsif len == 7 || len == 8 || len == 9
      hundreds_array = num_int_array.pop(3)
      hundreds_int = hundreds_array.join().to_i
      thousands_array = num_int_array.pop(3)
      thousands_int = thousands_array.join().to_i
      millions_int = num_int_array.join().to_i
      if thousands_int + hundreds_int == 0
        word = millions_int.hundreds() + " million"
      elsif thousands_int == 0 && hundreds_int != 0
        word = millions_int.hundreds() + " million " + hundreds_int.hundreds()
      else
        word = millions_int.hundreds() + " million " + thousands_int.hundreds() + " thousand " + hundreds_int.hundreds()
      end
    elsif len == 10 || len == 11 || len == 12
      hundreds_array = num_int_array.pop(3)
      hundreds_int = hundreds_array.join().to_i
      thousands_array = num_int_array.pop(3)
      thousands_int = thousands_array.join().to_i
      millions_array = num_int_array.pop(3)
      millions_int = millions_array.join().to_i
      trillions_int = num_int_array.join().to_i
      if millions_int + thousands_int + hundreds_int == 0
        word = trillions_int.hundreds() + " trillion"
      elsif millions_int == 0 && thousands_int == 0 && hundreds_int != 0
        word = trillions_int.hundreds() + " trillion " + hundreds_int.hundreds()
      elsif millions_int == 0 && thousands_int != 0 && hundreds_int == 0
        word = trillions_int.hundreds() + " trillion " + thousands_int.hundreds() + " thousand"
      elsif millions_int == 0 && thousands_int != 0 && hundreds_int != 0
        word = trillions_int.hundreds() + " trillion " + thousands_int.hundreds() + " thousand " + hundreds_int.hundreds()
      else
        word = trillions_int.hundreds() + " trillion " + millions_int.hundreds() + " million " + thousands_int.hundreds() + " thousand " + hundreds_int.hundreds()
      end
    else
      word = "invalid entry"
    end

    return word
  end
end
