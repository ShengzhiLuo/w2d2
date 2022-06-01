# Define your methods here.

def string_map!(str,&blc)
    str.each_char.with_index do |char,i|
            str[i] = blc.call(char)
    end
    str
end


def three?(arr,&blc)
   arr.count{|ele| blc.call(ele)} == 3
end


def nand_select(arr,prc1,prc2)
    arr.reject{|ele| prc1.call(ele)&&prc2.call(ele)}
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each do |k,v|
        sum += v.sum
    end
    sum
end


def abbreviate(sent)
    words = sent.split(" ")
    arr = []
    arr = words.map do |word|
        word.length <5 ? word : vowels_remove(word)
    end
    arr.join(" ")
end

def vowels_remove(word)
    vowels = "aeiouAEIOU"
    str = ""
    word.each_char do |char|
        if !vowels.include?(char)
            str << char
        end
    end
    str
end

def hash_selector(hash,*arr)
    if arr == []
        return hash
    end
    hash.select{|k,v| arr.count(k) == 1}
end