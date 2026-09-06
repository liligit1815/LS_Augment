.class public Lx1/D;
.super Ljava/lang/Object;
.source "HanziToPinyin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lx1/D$a;
    }
.end annotation


# static fields
.field private static volatile c:Lx1/D;

.field private static d:Lx1/A;


# instance fields
.field private a:Landroid/icu/text/Transliterator;

.field private b:Landroid/icu/text/Transliterator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lx1/A;

    .line 2
    .line 3
    invoke-direct {v0}, Lx1/A;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx1/D;->d:Lx1/A;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    const-string v0, "Han-Latin/Names; Latin-Ascii; Any-Upper"

    .line 5
    .line 6
    invoke-static {v0}, Landroid/icu/text/Transliterator;->getInstance(Ljava/lang/String;)Landroid/icu/text/Transliterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lx1/D;->a:Landroid/icu/text/Transliterator;

    .line 11
    .line 12
    const-string v0, "Latin-Ascii"

    .line 13
    .line 14
    invoke-static {v0}, Landroid/icu/text/Transliterator;->getInstance(Ljava/lang/String;)Landroid/icu/text/Transliterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lx1/D;->b:Landroid/icu/text/Transliterator;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    const-string p0, "HanziToPinyin"

    .line 22
    .line 23
    const-string v0, "Han-Latin/Names transliterator data is missing, HanziToPinyin is disabled"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private a(Ljava/lang/StringBuilder;Ljava/util/ArrayList;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/ArrayList<",
            "Lx1/D$a;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lx1/D$a;

    .line 6
    .line 7
    invoke-direct {v0, p3, p0, p0}, Lx1/D$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static c()Lx1/D;
    .locals 2

    .line 1
    sget-object v0, Lx1/D;->c:Lx1/D;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lx1/D;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lx1/D;->c:Lx1/D;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lx1/D;

    .line 13
    .line 14
    invoke-direct {v1}, Lx1/D;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lx1/D;->c:Lx1/D;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lx1/D;->c:Lx1/D;

    .line 27
    .line 28
    return-object v0
.end method

.method private d(C)Lx1/D$a;
    .locals 1

    .line 1
    sget-object p0, Lx1/D;->d:Lx1/A;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lx1/A;->a(C)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    new-instance p0, Lx1/D$a;

    .line 10
    .line 11
    invoke-direct {p0}, Lx1/D$a;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lx1/D$a;->b:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    iput v0, p0, Lx1/D$a;->a:I

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lx1/D$a;->d:Z

    .line 25
    .line 26
    sget-object v0, Lx1/D;->d:Lx1/A;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lx1/A;->b(C)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lx1/D$a;->f:[Ljava/lang/String;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    aget-object p1, p1, v0

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Lx1/D$a;->f:[Ljava/lang/String;

    .line 44
    .line 45
    aget-object p1, p1, v0

    .line 46
    .line 47
    iput-object p1, p0, Lx1/D$a;->c:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    iget-object p1, p0, Lx1/D$a;->f:[Ljava/lang/String;

    .line 50
    .line 51
    array-length p1, p1

    .line 52
    iput p1, p0, Lx1/D$a;->e:I

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_1
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method private g(C)Z
    .locals 0

    .line 1
    sget-object p0, Lx1/D;->d:Lx1/A;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lx1/A;->a(C)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private h(CLx1/D$a;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p2, Lx1/D$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    const/16 v1, 0x80

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ge p1, v1, :cond_0

    .line 11
    .line 12
    iput v2, p2, Lx1/D$a;->a:I

    .line 13
    .line 14
    iput-object v0, p2, Lx1/D$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/16 v1, 0x250

    .line 18
    .line 19
    if-lt p1, v1, :cond_4

    .line 20
    .line 21
    const/16 v1, 0x1e00

    .line 22
    .line 23
    if-gt v1, p1, :cond_1

    .line 24
    .line 25
    const/16 v1, 0x1eff

    .line 26
    .line 27
    if-ge p1, v1, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 p1, 0x2

    .line 31
    iput p1, p2, Lx1/D$a;->a:I

    .line 32
    .line 33
    iget-object p0, p0, Lx1/D;->a:Landroid/icu/text/Transliterator;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/icu/text/Transliterator;->transliterate(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iput-object p0, p2, Lx1/D$a;->c:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_3

    .line 46
    .line 47
    iget-object p0, p2, Lx1/D$a;->b:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p1, p2, Lx1/D$a;->c:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void

    .line 59
    :cond_3
    :goto_0
    const/4 p0, 0x3

    .line 60
    iput p0, p2, Lx1/D$a;->a:I

    .line 61
    .line 62
    iget-object p0, p2, Lx1/D$a;->b:Ljava/lang/String;

    .line 63
    .line 64
    iput-object p0, p2, Lx1/D$a;->c:Ljava/lang/String;

    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    :goto_1
    iput v2, p2, Lx1/D$a;->a:I

    .line 68
    .line 69
    iget-object p0, p0, Lx1/D;->b:Landroid/icu/text/Transliterator;

    .line 70
    .line 71
    if-nez p0, :cond_5

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_5
    invoke-virtual {p0, v0}, Landroid/icu/text/Transliterator;->transliterate(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    :goto_2
    iput-object v0, p2, Lx1/D$a;->c:Ljava/lang/String;

    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lx1/D$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lx1/D;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_8

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v3, Lx1/D$a;

    .line 30
    .line 31
    invoke-direct {v3}, Lx1/D$a;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v4, 0x1

    .line 35
    const/4 v5, 0x0

    .line 36
    :goto_0
    if-ge v5, v1, :cond_7

    .line 37
    .line 38
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    invoke-static {v6}, Ljava/lang/Character;->isSpaceChar(C)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_1

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-lez v6, :cond_6

    .line 53
    .line 54
    invoke-direct {p0, v2, v0, v4}, Lx1/D;->a(Ljava/lang/StringBuilder;Ljava/util/ArrayList;I)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-direct {p0, v6, v3}, Lx1/D;->h(CLx1/D$a;)V

    .line 59
    .line 60
    .line 61
    iget v7, v3, Lx1/D$a;->a:I

    .line 62
    .line 63
    const/4 v8, 0x2

    .line 64
    if-ne v7, v8, :cond_4

    .line 65
    .line 66
    invoke-direct {p0, v6}, Lx1/D;->g(C)Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-eqz v7, :cond_2

    .line 71
    .line 72
    invoke-direct {p0, v6}, Lx1/D;->d(C)Lx1/D$a;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    if-eqz v6, :cond_2

    .line 77
    .line 78
    move-object v3, v6

    .line 79
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    if-lez v6, :cond_3

    .line 84
    .line 85
    invoke-direct {p0, v2, v0, v4}, Lx1/D;->a(Ljava/lang/StringBuilder;Ljava/util/ArrayList;I)V

    .line 86
    .line 87
    .line 88
    :cond_3
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    new-instance v3, Lx1/D$a;

    .line 92
    .line 93
    invoke-direct {v3}, Lx1/D$a;-><init>()V

    .line 94
    .line 95
    .line 96
    move v4, v8

    .line 97
    goto :goto_1

    .line 98
    :cond_4
    if-eq v4, v7, :cond_5

    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-lez v6, :cond_5

    .line 105
    .line 106
    invoke-direct {p0, v2, v0, v4}, Lx1/D;->a(Ljava/lang/StringBuilder;Ljava/util/ArrayList;I)V

    .line 107
    .line 108
    .line 109
    :cond_5
    iget-object v4, v3, Lx1/D$a;->c:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget v4, v3, Lx1/D$a;->a:I

    .line 115
    .line 116
    :cond_6
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_7
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-lez p1, :cond_8

    .line 124
    .line 125
    invoke-direct {p0, v2, v0, v4}, Lx1/D;->a(Ljava/lang/StringBuilder;Ljava/util/ArrayList;I)V

    .line 126
    .line 127
    .line 128
    :cond_8
    :goto_2
    return-object v0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/D;->a:Landroid/icu/text/Transliterator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public f(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    if-ge v1, p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sget-object v3, Lx1/D;->d:Lx1/A;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Lx1/A;->a(C)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v0
.end method
