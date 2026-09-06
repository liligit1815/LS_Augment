.class public LI1/e;
.super Ljava/lang/Object;
.source "StringMatcherUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LI1/e$b;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/Character;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, LI1/e;->a:Ljava/lang/Character;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(I)I
    .locals 0

    .line 1
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ljava/lang/CharSequence;I)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget-object p1, LI1/e;->a:Ljava/lang/Character;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static c(Ljava/lang/CharSequence;LI1/e$b;)Lcom/android/launcher3/util/x0;
    .locals 7

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    if-le v0, v1, :cond_4

    .line 8
    .line 9
    sget-object v1, LI1/e;->a:Ljava/lang/Character;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {p0, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;C)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v3, -0x1

    .line 20
    if-eq v1, v3, :cond_0

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_0
    new-instance v1, Lcom/android/launcher3/util/x0;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {v3}, Ljava/lang/Character;->getType(I)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v4, 0x1

    .line 37
    invoke-static {p0, v4}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-static {v5}, Ljava/lang/Character;->getType(I)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    :goto_0
    if-ge v4, v0, :cond_3

    .line 46
    .line 47
    add-int/lit8 v6, v0, -0x1

    .line 48
    .line 49
    if-ge v4, v6, :cond_1

    .line 50
    .line 51
    add-int/lit8 v6, v4, 0x1

    .line 52
    .line 53
    invoke-static {p0, v6}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    invoke-static {v6}, Ljava/lang/Character;->getType(I)I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v6, v2

    .line 63
    :goto_1
    invoke-virtual {p1, v5, v3, v6}, LI1/e$b;->b(III)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    add-int/lit8 v3, v4, -0x1

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 72
    .line 73
    .line 74
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 75
    .line 76
    move v3, v5

    .line 77
    move v5, v6

    .line 78
    goto :goto_0

    .line 79
    :cond_3
    return-object v1

    .line 80
    :cond_4
    :goto_2
    invoke-static {v2, v0}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, LI1/c;

    .line 85
    .line 86
    invoke-direct {v0, p0}, LI1/c;-><init>(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p1, v0}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p1, LI1/d;

    .line 94
    .line 95
    invoke-direct {p1}, LI1/d;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-interface {p0, p1}, Ljava/util/stream/IntStream;->map(Ljava/util/function/IntUnaryOperator;)Ljava/util/stream/IntStream;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0}, Ljava/util/stream/IntStream;->toArray()[I

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;LI1/e$b;)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-lt v1, v0, :cond_4

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    invoke-static {p0}, LI1/e;->e(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->codePointAt(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-static {v3}, Ljava/lang/Character;->getType(I)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    sub-int v4, v1, v0

    .line 39
    .line 40
    move v5, v2

    .line 41
    move v6, v5

    .line 42
    :goto_0
    if-gt v5, v4, :cond_4

    .line 43
    .line 44
    const/4 v7, 0x1

    .line 45
    add-int/lit8 v8, v1, -0x1

    .line 46
    .line 47
    if-ge v5, v8, :cond_2

    .line 48
    .line 49
    add-int/lit8 v8, v5, 0x1

    .line 50
    .line 51
    invoke-virtual {p1, v8}, Ljava/lang/String;->codePointAt(I)I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    invoke-static {v8}, Ljava/lang/Character;->getType(I)I

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    move v8, v2

    .line 61
    :goto_1
    invoke-virtual {p2, v3, v6, v8}, LI1/e$b;->b(III)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_3

    .line 66
    .line 67
    add-int v6, v5, v0

    .line 68
    .line 69
    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-virtual {p2, p0, v6}, LI1/e$b;->c(Ljava/lang/String;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    if-eqz v6, :cond_3

    .line 78
    .line 79
    return v7

    .line 80
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 81
    .line 82
    move v6, v3

    .line 83
    move v3, v8

    .line 84
    goto :goto_0

    .line 85
    :cond_4
    :goto_2
    return v2
.end method

.method private static e(Ljava/lang/String;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/lang/String;->codePointAt(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    add-int/2addr v1, v3

    .line 18
    sget-object v3, LI1/e$a;->a:[I

    .line 19
    .line 20
    invoke-static {v2}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ljava/lang/Character$UnicodeScript;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    aget v2, v3, v2

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    if-eq v2, v3, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return v3

    .line 35
    :cond_1
    return v0
.end method
