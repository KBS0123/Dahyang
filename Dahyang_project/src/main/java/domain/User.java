package domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "USERS")
public class User extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID")
    private Long id;

    @Column(name = "EMAIL", nullable = false)
    private String email;

    @Column(name = "PASSWORD", nullable = false)
    private String password;

    @Column(name = "NICKNAME", nullable = false)
    private String nickname;

    @Column(name = "BIRTHDAY")
    private LocalDate birthday;

    @Column(name = "HOBBIES")
    private String hobbies;

    @Column(name = "IMAGES")
    private String images;

    @Builder
    public User(String email, String password, String nickname, LocalDate birthday, String hobbies, String images) {
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.birthday = birthday;
        this.hobbies = hobbies;
        this.images = images;
    }

    public User update(String nickname, LocalDate birthday, String hobbies, String images) {
        this.nickname = nickname;
        this.birthday = birthday;
        this.hobbies = hobbies;
        this.images = images;
        return this;
    }
}
