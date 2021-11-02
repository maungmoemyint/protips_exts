module ApplicationHelper

  AVATAR1 = "https://68.media.tumblr.com/7d65a925636d6e3df94e2ebe30667c29/tumblr_nq1zg0MEn51qg6rkio1_500.jpg"
  AVATAR2 = "https://68.media.tumblr.com/9f9b498bf798ef43dddeaa78cec7b027/tumblr_o51oavbMDx1ugpbmuo7_500.png"
  AVATAR3 = "http://78.media.tumblr.com/75bad14fee104f69652084d545213291/tumblr_mldfty8fh41qcnibxo5_1280.png"
  AVATAR4 = "https://68.media.tumblr.com/22d1c50c3e2ca1062a94b47a65bfeb6d/tumblr_o51oavbMDx1ugpbmuo10_500.png"
  AVATAR5 = "https://68.media.tumblr.com/7d65a925636d6e3df94e2ebe30667c29/tumblr_nq1zg0MEn51qg6rkio1_500.jpg"


  def default_avatar(user)
    if user.name.present?
      first_letter = user.name[0].downcase
    else
      first_letter = nil
    end

    case(first_letter)
    when first_letter = 'a' then AVATAR1
    when first_letter = 'b' then AVATAR1
    when first_letter = 'c' then AVATAR1
    when first_letter = 'd' then AVATAR1
    when first_letter = 'e' then AVATAR1
    when first_letter = 'f' then AVATAR1

    when first_letter = 'g' then AVATAR2
    when first_letter = 'h' then AVATAR2
    when first_letter = 'i' then AVATAR2
    when first_letter = 'j' then AVATAR2
    when first_letter = 'k' then AVATAR2
    when first_letter = 'l' then AVATAR2
    when first_letter = 'm' then AVATAR2
    when first_letter = 'n' then AVATAR2

    when first_letter = 'o' then AVATAR3
    when first_letter = 'p' then AVATAR3
    when first_letter = 'q' then AVATAR3
    when first_letter = 'r' then AVATAR3
    when first_letter = 's' then AVATAR3
    when first_letter = 't' then AVATAR3
    when first_letter = 'u' then AVATAR3

    when first_letter = 'v' then AVATAR4
    when first_letter = 'w' then AVATAR4
    when first_letter = 'x' then AVATAR4
    when first_letter = 'y' then AVATAR4
    when first_letter = 'z' then AVATAR4
    else AVATAR5
    end
  end


  def pluralize_comments(comments)
    if (comments.count > 0)
      "#{comments.count} comments"
    else
      "no comments yet"
    end
  end

  def pluralize_tips(tips)
    if (tips.count > 0)
      "#{tips.count} tips"
    else
      "no tips yet'"
    end
  end

end
