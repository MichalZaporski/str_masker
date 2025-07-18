# frozen_string_literal: true

require 'test_helper'

class TestStrMasker < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::StrMasker::VERSION
  end

  def test_that_it_masks_properly
    assert_equal '********', StrMasker.mask_string('password')
    assert_equal 'pas*****', StrMasker.mask_string('password', from: 3)
    assert_equal '******rd', StrMasker.mask_string('password', to: -3)
    assert_equal 'p******d', StrMasker.mask_string('password', from: 1, to: -2)
    assert_equal 'password', StrMasker.mask_string('password', from: 20)
    assert_equal 'password', StrMasker.mask_string('password', to: -20)
    assert_equal 'password', StrMasker.mask_string('password', from: 10, to: -20)
  end

  def test_that_it_masks_with_custom_char
    assert_equal '????????', StrMasker.mask_string('password', char: '?')
    assert_equal 'pas?????', StrMasker.mask_string('password', from: 3, char: '?')
  end

  def test_from_is_not_integer
    assert_raises(ArgumentError, '"from" must be a non-negative int') do
      StrMasker.mask_string('test', from: '0')
    end
  end

  def test_from_is_negative
    assert_raises(ArgumentError, '"from" must be a non-negative int') do
      StrMasker.mask_string('test', from: -1)
    end
  end

  def test_to_is_not_integer
    assert_raises(ArgumentError, '"to" must be a negative int') do
      StrMasker.mask_string('test', to: '0')
    end
  end

  def test_to_is_non_negative
    assert_raises(ArgumentError, '"to" must be a negative int') do
      StrMasker.mask_string('test', to: 0)
    end
  end

  def test_char_is_not_string
    assert_raises(ArgumentError, '"char" must be a single character string') do
      StrMasker.mask_string('test', char: 1)
    end
  end

  def test_char_is_empty_string
    assert_raises(ArgumentError, '"char" must be a single character string') do
      StrMasker.mask_string('test', char: '')
    end
  end

  def test_char_is_long_string
    assert_raises(ArgumentError, '"char" must be a single character string') do
      StrMasker.mask_string('test', char: '**')
    end
  end

  def test_nil_input_returns_nil
    assert_nil StrMasker.mask_string(nil)
  end

  def test_empty_string
    assert_equal '', StrMasker.mask_string('')
  end
end
