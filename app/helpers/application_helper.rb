module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'anon.png'
    end
  end

  def sklonenie(number, krokodil, krokodila, krokodilov)
    if number == nil || !number.is_a?(Numeric)
      return nil
    end

    ostatok_first = number % 100

    return krokodilov if (11..14).include?(ostatok_first)

    ostatok_second = number % 10

    return krokodil if ostatok_second == 1

    return krokodila if (2..4).include?(ostatok_second)

    return krokodilov if ostatok_second > 4 || ostatok_second == 0
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
