require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it '全ての項目が正しく入力されていれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaaa99'
        @user.password_confirmation = 'aaaa99'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameを入力してください')
      end

      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameは全角で入力してください')
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameを入力してください')
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameは全角で入力してください')
      end

      it 'employee_numberが空だと登録できない' do
        @user.employee_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Employee numberを入力してください')
      end

      it 'employee_numberが半角数字以外だと登録できない' do
        @user.employee_number = '１０００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Employee numberは半角数字で入力してください')
      end

      it '重複したemployee_numberが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, employee_number: @user.employee_number)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Employee numberはすでに存在します')
      end

      it 'division_idが空だと登録できない' do
        @user.division_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Divisionを入力してください')
      end

      it 'division_idが0だと登録できない' do
        @user.division_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('Divisionは0以外の値にしてください')
      end

      it 'position_idが空だと登録できない' do
        @user.position_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Positionを入力してください')
      end

      it 'position_idが0だと登録できない' do
        @user.position_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('Positionは0以外の値にしてください')
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordを入力してください')
      end

      it 'passwordが英字のみの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは英数字混合にしてください')
      end

      it 'passwordが数字のみの場合登録できない' do
        @user.password = '999999'
        @user.password_confirmation = '999999'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは英数字混合にしてください')
      end

      it 'passwordが存在してもpassword_confimationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'aaaa9'
        @user.password_confirmation = 'aaaa9'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは6文字以上で入力してください')
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailを入力してください')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Emailは不正な値です')
      end
    end
  end
end
