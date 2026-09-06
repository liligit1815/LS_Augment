.class public Landroidx/core/app/i$e;
.super Landroidx/core/app/i$f;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/app/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/app/i$e$b;,
        Landroidx/core/app/i$e$a;,
        Landroidx/core/app/i$e$c;
    }
.end annotation


# instance fields
.field private e:I

.field private f:Landroidx/core/app/o;

.field private g:Landroid/app/PendingIntent;

.field private h:Landroid/app/PendingIntent;

.field private i:Landroid/app/PendingIntent;

.field private j:Z

.field private k:Ljava/lang/Integer;

.field private l:Ljava/lang/Integer;

.field private m:Landroidx/core/graphics/drawable/IconCompat;

.field private n:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/core/app/i$f;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i(Landroidx/core/app/i$a;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/core/app/i$a;->c()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "key_action_priority"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private j(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Landroidx/core/app/i$a;
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iget-object p3, p0, Landroidx/core/app/i$f;->a:Landroidx/core/app/i$d;

    .line 4
    .line 5
    iget-object p3, p3, Landroidx/core/app/i$d;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p3, p4}, Lz/a;->c(Landroid/content/Context;I)I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    :cond_0
    new-instance p4, Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    invoke-direct {p4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Landroidx/core/app/i$f;->a:Landroidx/core/app/i$d;

    .line 21
    .line 22
    iget-object v0, v0, Landroidx/core/app/i$d;->a:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p4, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 33
    .line 34
    .line 35
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    invoke-direct {p2, p3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p4}, Landroid/text/SpannableStringBuilder;->length()I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    const/16 v0, 0x12

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p4, p2, v1, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 52
    .line 53
    .line 54
    new-instance p2, Landroidx/core/app/i$a$a;

    .line 55
    .line 56
    iget-object p0, p0, Landroidx/core/app/i$f;->a:Landroidx/core/app/i$d;

    .line 57
    .line 58
    iget-object p0, p0, Landroidx/core/app/i$d;->a:Landroid/content/Context;

    .line 59
    .line 60
    invoke-static {p0, p1}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/Context;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-direct {p2, p0, p4, p5}, Landroidx/core/app/i$a$a;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Landroidx/core/app/i$a$a;->a()Landroidx/core/app/i$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroidx/core/app/i$a;->c()Landroid/os/Bundle;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string p2, "key_action_priority"

    .line 76
    .line 77
    const/4 p3, 0x1

    .line 78
    invoke-virtual {p1, p2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    return-object p0
.end method

.method private k()Landroidx/core/app/i$a;
    .locals 8

    .line 1
    sget v0, Lx/c;->b:I

    .line 2
    .line 3
    sget v1, Lx/c;->a:I

    .line 4
    .line 5
    iget-object v7, p0, Landroidx/core/app/i$e;->g:Landroid/app/PendingIntent;

    .line 6
    .line 7
    if-nez v7, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-boolean v2, p0, Landroidx/core/app/i$e;->j:Z

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    move v3, v0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move v3, v1

    .line 18
    :goto_0
    if-eqz v2, :cond_2

    .line 19
    .line 20
    sget v0, Lx/e;->b:I

    .line 21
    .line 22
    :goto_1
    move v4, v0

    .line 23
    goto :goto_2

    .line 24
    :cond_2
    sget v0, Lx/e;->a:I

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :goto_2
    iget-object v5, p0, Landroidx/core/app/i$e;->k:Ljava/lang/Integer;

    .line 28
    .line 29
    sget v6, Lx/b;->a:I

    .line 30
    .line 31
    move-object v2, p0

    .line 32
    invoke-direct/range {v2 .. v7}, Landroidx/core/app/i$e;->j(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Landroidx/core/app/i$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method private l()Landroidx/core/app/i$a;
    .locals 6

    .line 1
    sget v1, Lx/c;->c:I

    .line 2
    .line 3
    iget-object v5, p0, Landroidx/core/app/i$e;->h:Landroid/app/PendingIntent;

    .line 4
    .line 5
    if-nez v5, :cond_0

    .line 6
    .line 7
    sget v2, Lx/e;->d:I

    .line 8
    .line 9
    iget-object v3, p0, Landroidx/core/app/i$e;->l:Ljava/lang/Integer;

    .line 10
    .line 11
    sget v4, Lx/b;->b:I

    .line 12
    .line 13
    iget-object v5, p0, Landroidx/core/app/i$e;->i:Landroid/app/PendingIntent;

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    invoke-direct/range {v0 .. v5}, Landroidx/core/app/i$e;->j(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Landroidx/core/app/i$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    move-object v0, p0

    .line 22
    sget v2, Lx/e;->c:I

    .line 23
    .line 24
    iget-object v3, v0, Landroidx/core/app/i$e;->l:Ljava/lang/Integer;

    .line 25
    .line 26
    sget v4, Lx/b;->b:I

    .line 27
    .line 28
    invoke-direct/range {v0 .. v5}, Landroidx/core/app/i$e;->j(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Landroidx/core/app/i$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method


# virtual methods
.method public a(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/core/app/i$f;->a(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.callType"

    .line 5
    .line 6
    iget v1, p0, Landroidx/core/app/i$e;->e:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    const-string v0, "android.callIsVideo"

    .line 12
    .line 13
    iget-boolean v1, p0, Landroidx/core/app/i$e;->j:Z

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/core/app/i$e;->f:Landroidx/core/app/o;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/core/app/o;->g()Landroid/app/Person;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Landroidx/core/app/i$e$b;->a(Landroid/app/Person;)Landroid/os/Parcelable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "android.callPerson"

    .line 31
    .line 32
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Landroidx/core/app/i$e;->m:Landroidx/core/graphics/drawable/IconCompat;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v1, p0, Landroidx/core/app/i$f;->a:Landroidx/core/app/i$d;

    .line 40
    .line 41
    iget-object v1, v1, Landroidx/core/app/i$d;->a:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroidx/core/graphics/drawable/IconCompat;->n(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Landroidx/core/app/i$e$a;->a(Landroid/graphics/drawable/Icon;)Landroid/os/Parcelable;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "android.verificationIcon"

    .line 52
    .line 53
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    const-string v0, "android.verificationText"

    .line 57
    .line 58
    iget-object v1, p0, Landroidx/core/app/i$e;->n:Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    const-string v0, "android.answerIntent"

    .line 64
    .line 65
    iget-object v1, p0, Landroidx/core/app/i$e;->g:Landroid/app/PendingIntent;

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 68
    .line 69
    .line 70
    const-string v0, "android.declineIntent"

    .line 71
    .line 72
    iget-object v1, p0, Landroidx/core/app/i$e;->h:Landroid/app/PendingIntent;

    .line 73
    .line 74
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 75
    .line 76
    .line 77
    const-string v0, "android.hangUpIntent"

    .line 78
    .line 79
    iget-object v1, p0, Landroidx/core/app/i$e;->i:Landroid/app/PendingIntent;

    .line 80
    .line 81
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Landroidx/core/app/i$e;->k:Ljava/lang/Integer;

    .line 85
    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    const-string v1, "android.answerColor"

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object p0, p0, Landroidx/core/app/i$e;->l:Ljava/lang/Integer;

    .line 98
    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    const-string v0, "android.declineColor"

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    :cond_3
    return-void
.end method

.method public b(Landroidx/core/app/h;)V
    .locals 3

    .line 1
    iget v0, p0, Landroidx/core/app/i$e;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const-string v0, "NotifCompat"

    .line 13
    .line 14
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "Unrecognized call type in CallStyle: "

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, p0, Landroidx/core/app/i$e;->e:I

    .line 31
    .line 32
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    :cond_0
    const/4 v0, 0x0

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p0, Landroidx/core/app/i$e;->f:Landroidx/core/app/o;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroidx/core/app/o;->g()Landroid/app/Person;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Landroidx/core/app/i$e;->i:Landroid/app/PendingIntent;

    .line 55
    .line 56
    iget-object v2, p0, Landroidx/core/app/i$e;->g:Landroid/app/PendingIntent;

    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Landroidx/core/app/i$e$c;->c(Landroid/app/Person;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)Landroid/app/Notification$CallStyle;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget-object v0, p0, Landroidx/core/app/i$e;->f:Landroidx/core/app/o;

    .line 64
    .line 65
    invoke-virtual {v0}, Landroidx/core/app/o;->g()Landroid/app/Person;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Landroidx/core/app/i$e;->i:Landroid/app/PendingIntent;

    .line 70
    .line 71
    invoke-static {v0, v1}, Landroidx/core/app/i$e$c;->b(Landroid/app/Person;Landroid/app/PendingIntent;)Landroid/app/Notification$CallStyle;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object v0, p0, Landroidx/core/app/i$e;->f:Landroidx/core/app/o;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroidx/core/app/o;->g()Landroid/app/Person;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Landroidx/core/app/i$e;->h:Landroid/app/PendingIntent;

    .line 83
    .line 84
    iget-object v2, p0, Landroidx/core/app/i$e;->g:Landroid/app/PendingIntent;

    .line 85
    .line 86
    invoke-static {v0, v1, v2}, Landroidx/core/app/i$e$c;->a(Landroid/app/Person;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)Landroid/app/Notification$CallStyle;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    :goto_0
    if-eqz v0, :cond_7

    .line 91
    .line 92
    invoke-interface {p1}, Landroidx/core/app/h;->a()Landroid/app/Notification$Builder;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {v0, p1}, Landroid/app/Notification$CallStyle;->setBuilder(Landroid/app/Notification$Builder;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Landroidx/core/app/i$e;->k:Ljava/lang/Integer;

    .line 100
    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-static {v0, p1}, Landroidx/core/app/i$e$c;->d(Landroid/app/Notification$CallStyle;I)Landroid/app/Notification$CallStyle;

    .line 108
    .line 109
    .line 110
    :cond_4
    iget-object p1, p0, Landroidx/core/app/i$e;->l:Ljava/lang/Integer;

    .line 111
    .line 112
    if-eqz p1, :cond_5

    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    invoke-static {v0, p1}, Landroidx/core/app/i$e$c;->e(Landroid/app/Notification$CallStyle;I)Landroid/app/Notification$CallStyle;

    .line 119
    .line 120
    .line 121
    :cond_5
    iget-object p1, p0, Landroidx/core/app/i$e;->n:Ljava/lang/CharSequence;

    .line 122
    .line 123
    invoke-static {v0, p1}, Landroidx/core/app/i$e$c;->h(Landroid/app/Notification$CallStyle;Ljava/lang/CharSequence;)Landroid/app/Notification$CallStyle;

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Landroidx/core/app/i$e;->m:Landroidx/core/graphics/drawable/IconCompat;

    .line 127
    .line 128
    if-eqz p1, :cond_6

    .line 129
    .line 130
    iget-object v1, p0, Landroidx/core/app/i$f;->a:Landroidx/core/app/i$d;

    .line 131
    .line 132
    iget-object v1, v1, Landroidx/core/app/i$d;->a:Landroid/content/Context;

    .line 133
    .line 134
    invoke-virtual {p1, v1}, Landroidx/core/graphics/drawable/IconCompat;->n(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {v0, p1}, Landroidx/core/app/i$e$c;->g(Landroid/app/Notification$CallStyle;Landroid/graphics/drawable/Icon;)Landroid/app/Notification$CallStyle;

    .line 139
    .line 140
    .line 141
    :cond_6
    iget-boolean p0, p0, Landroidx/core/app/i$e;->j:Z

    .line 142
    .line 143
    invoke-static {v0, p0}, Landroidx/core/app/i$e$c;->f(Landroid/app/Notification$CallStyle;Z)Landroid/app/Notification$CallStyle;

    .line 144
    .line 145
    .line 146
    :cond_7
    return-void
.end method

.method protected c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "androidx.core.app.NotificationCompat$CallStyle"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroidx/core/app/i$a;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/core/app/i$e;->l()Landroidx/core/app/i$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Landroidx/core/app/i$e;->k()Landroidx/core/app/i$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v3, 0x3

    .line 12
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/core/app/i$f;->a:Landroidx/core/app/i$d;

    .line 19
    .line 20
    iget-object v0, v0, Landroidx/core/app/i$d;->b:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    const/4 v4, 0x2

    .line 24
    if-eqz v0, :cond_4

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-eqz v5, :cond_4

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    check-cast v5, Landroidx/core/app/i$a;

    .line 41
    .line 42
    invoke-virtual {v5}, Landroidx/core/app/i$a;->j()Z

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    if-eqz v6, :cond_1

    .line 47
    .line 48
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-direct {p0, v5}, Landroidx/core/app/i$e;->i(Landroidx/core/app/i$a;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-eqz v6, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    if-le v4, v3, :cond_3

    .line 60
    .line 61
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    add-int/lit8 v4, v4, -0x1

    .line 65
    .line 66
    :cond_3
    :goto_1
    if-eqz v1, :cond_0

    .line 67
    .line 68
    if-ne v4, v3, :cond_0

    .line 69
    .line 70
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    add-int/lit8 v4, v4, -0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    if-eqz v1, :cond_5

    .line 77
    .line 78
    if-lt v4, v3, :cond_5

    .line 79
    .line 80
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :cond_5
    return-object v2
.end method
