class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def send_receipt(order_id)
        @order = Order.find(order_id)
        puts 'doing this'
        mail(to: 'no-reply@jungle.com', subject: 'Your Reciept')
    end
end
