require('rspec')
require('numword')

describe('String#numword') do

  it('returns the correct word for a number between 0 and 19') do
    expect("19".numword()).to(eq("nineteen"))
  end

  it('returns the correct word for a number greater than 19 but less than 100') do
    expect("85".numword()).to(eq("eighty five"))
  end

  it('returns the correct word for a number between 100 and 999') do
    expect("452".numword()).to(eq("four hundred fifty two"))
  end

  it('returns the correct word for a number between 1000 and 999999') do
    expect("234567".numword()).to(eq("two hundred thirty four thousand five hundred sixty seven"))
  end

  it('returns the correct word for a number between 1000000 and 999999999') do
    expect("1234567".numword()).to(eq("one million two hundred thirty four thousand five hundred sixty seven"))
  end

  it('returns the correct word for a number up to 999 trillion') do
    expect("1111234567".numword()).to(eq("one trillion one hundred eleven million two hundred thirty four thousand five hundred sixty seven"))
  end

  it('doesn\'t return a zero at the end of a multiple of 100') do
    expect("200".numword()).to(eq("two hundred"))
  end

  it('returns "zero" for 0') do
    expect("0".numword()).to(eq("zero"))
  end

  it('is correct for 1000') do
    expect("1000".numword()).to(eq("one thousand"))
  end

  it('is correct for 1000000') do
    expect("1000000".numword()).to(eq("one million"))
  end

  it('is correct for 1000000000') do
    expect("1000000000".numword()).to(eq("one trillion"))
  end

  it('will return correct number with series of zeroes in middle') do
    expect("1000111".numword()).to(eq("one million one hundred eleven"))
  end

  it('will return correct number with series of zeroes in middle') do
    expect("1000100000".numword()).to(eq("one trillion one hundred thousand"))
  end

  it('will return correct number with series of zeroes in middle') do
    expect("1000000111".numword()).to(eq("one trillion one hundred eleven"))
  end
end
