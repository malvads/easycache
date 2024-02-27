require_relative '../lib/easycache'
require 'test/unit'

# Test EasyCache class
class EasyCacheTest < Test::Unit::TestCase
  def setup
    @cache = EasyCache.new
  end

  def test_fetch_caches_value_for_given_key
    @cache.fetch('test_key', 3600, true) { 'test_value' }
    assert_instance_of(Time, @cache.instance_variable_get(:@cache)['test_key'][:timestamp])
  end

  def test_fetch_retrieves_cached_value_for_given_key_if_not_expired
    @cache.fetch('test_key', 3600, true) { 'test_value' }
    assert_equal 'test_value', @cache.fetch('test_key')
  end

  def test_fetch_expires_cached_value_after_specified_expiration_time
    @cache.fetch('test_key', 1, true) { 'test_value' }
    sleep(2)
    assert_nil @cache.fetch('test_key')
  end

  def test_fetch_recomputes_expired_value_if_fetched_again
    @cache.fetch('test_key', 1, true) { 'test_value' }
    sleep(2)
    assert_equal 'new_test_value', @cache.fetch('test_key') { 'new_test_value' }
  end
end
