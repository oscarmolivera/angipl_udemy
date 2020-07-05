require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'initial columns' do
    it { is_expected.to have_db_column(:content) }
    it { is_expected.to have_db_column(:language_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:language) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:language) }
    it { is_expected.to belong_to(:user) }

    it do
      is_expected.to have_many(:translations_association)
        .class_name('Translation')
    end
    it do
      is_expected.to have_many(:translations)
        .through(:translations_association)
        .source(:translated_word)
    end
    it do
      is_expected.to have_many(:inverse_translations_association)
        .class_name('Translation')
        .with_foreign_key('translated_word_id')
    end
    it do
      is_expected.to have_many(:inverse_translations)
        .through(:inverse_translations_association)
        .source(:word)
    end
  end
end
