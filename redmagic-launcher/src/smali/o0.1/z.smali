.class public final Lo0/z;
.super Ljava/lang/Object;
.source "RuleParser.kt"


# static fields
.field public static final a:Lo0/z;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lo0/z;

    .line 2
    .line 3
    invoke-direct {v0}, Lo0/z;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lo0/z;->a:Lo0/z;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final a(Ljava/util/HashSet;Lo0/r;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Lo0/r;",
            ">;",
            "Lo0/r;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lo0/r;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lo0/r;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Lo0/r;->a()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {p0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v1, "Duplicated tag: "

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p0, " for "

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p0, ". The tag must be unique in XML rule definition."

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p1

    .line 70
    :cond_2
    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private final b(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/ComponentName;
    .locals 7

    .line 1
    if-eqz p2, :cond_3

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/String;->charAt(I)C

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    const/16 v6, 0x2e

    .line 19
    .line 20
    if-ne p2, v6, :cond_0

    .line 21
    .line 22
    new-instance p0, Landroid/content/ComponentName;

    .line 23
    .line 24
    new-instance p2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    const/4 v4, 0x6

    .line 44
    const/4 v5, 0x0

    .line 45
    const/16 v1, 0x2f

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-static/range {v0 .. v5}, LD4/g;->F(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-lez p2, :cond_1

    .line 54
    .line 55
    invoke-virtual {v0, p0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string p0, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    .line 60
    .line 61
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    add-int/lit8 p2, p2, 0x1

    .line 65
    .line 66
    invoke-virtual {v0, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string p0, "this as java.lang.String).substring(startIndex)"

    .line 71
    .line 72
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    const-string p0, "*"

    .line 76
    .line 77
    invoke-static {v0, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_2

    .line 82
    .line 83
    const/4 v4, 0x6

    .line 84
    const/4 v5, 0x0

    .line 85
    const/16 v1, 0x2e

    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    const/4 v3, 0x0

    .line 89
    invoke-static/range {v0 .. v5}, LD4/g;->F(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-gez p0, :cond_2

    .line 94
    .line 95
    new-instance p0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    new-instance p2, Landroid/content/ComponentName;

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-direct {p2, p1, p0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-object p2

    .line 116
    :cond_2
    new-instance p0, Landroid/content/ComponentName;

    .line 117
    .line 118
    invoke-direct {p0, p1, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 123
    .line 124
    const-string p1, "Activity name must not be null"

    .line 125
    .line 126
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    throw p0
.end method

.method private final c(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/a;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lm0/b;->a:[I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, p2, v1, v2, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    sget v0, Lm0/b;->c:I

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Lm0/b;->b:I

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v1, Lo0/a;

    .line 33
    .line 34
    const-string v2, "packageName"

    .line 35
    .line 36
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p1, v0}, Lo0/z;->b(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/ComponentName;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {v1, p0, p2}, Lo0/a;-><init>(Landroid/content/ComponentName;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object v1
.end method

.method private final d(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/b;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lm0/b;->d:[I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget p1, Lm0/b;->f:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget p2, Lm0/b;->e:I

    .line 19
    .line 20
    invoke-virtual {p0, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    .line 26
    .line 27
    new-instance p0, Lo0/b$a;

    .line 28
    .line 29
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p0, v0}, Lo0/b$a;-><init>(Ljava/util/Set;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lo0/b$a;->b(Z)Lo0/b$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lo0/b$a;->c(Ljava/lang/String;)Lo0/b$a;

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0}, Lo0/b$a;->a()Lo0/b;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method private final f(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/E;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lm0/b;->g:[I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, p2, v1, v2, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    sget v0, Lm0/b;->h:I

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Lm0/b;->j:I

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Lm0/b;->i:I

    .line 25
    .line 26
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v2, "packageName"

    .line 39
    .line 40
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, p1, v0}, Lo0/z;->b(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/ComponentName;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p0, p1, v1}, Lo0/z;->b(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/ComponentName;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Lo0/E;

    .line 52
    .line 53
    invoke-direct {p1, v0, p0, p2}, Lo0/E;-><init>(Landroid/content/ComponentName;Landroid/content/ComponentName;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method private final g(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/F;
    .locals 11

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object p1, Lm0/b;->k:[I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p2, p1, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget p1, Lm0/b;->w:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget p2, Lm0/b;->v:I

    .line 19
    .line 20
    const/high16 v1, 0x3f000000    # 0.5f

    .line 21
    .line 22
    invoke-virtual {p0, p2, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    sget v1, Lm0/b;->u:I

    .line 27
    .line 28
    const/16 v2, 0x258

    .line 29
    .line 30
    invoke-virtual {p0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sget v3, Lm0/b;->s:I

    .line 35
    .line 36
    invoke-virtual {p0, v3, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    sget v4, Lm0/b;->t:I

    .line 41
    .line 42
    invoke-virtual {p0, v4, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    sget v4, Lm0/b;->r:I

    .line 47
    .line 48
    sget-object v5, Lo0/H;->i:Lo0/k;

    .line 49
    .line 50
    invoke-virtual {v5}, Lo0/k;->a()F

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    invoke-virtual {p0, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    sget v5, Lm0/b;->q:I

    .line 59
    .line 60
    sget-object v6, Lo0/H;->j:Lo0/k;

    .line 61
    .line 62
    invoke-virtual {v6}, Lo0/k;->a()F

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    invoke-virtual {p0, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    sget v6, Lm0/b;->p:I

    .line 71
    .line 72
    sget-object v7, Lo0/B$c;->d:Lo0/B$c;

    .line 73
    .line 74
    invoke-virtual {v7}, Lo0/B$c;->a()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    invoke-virtual {p0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    sget v7, Lm0/b;->n:I

    .line 83
    .line 84
    sget-object v8, Lo0/H$d;->d:Lo0/H$d;

    .line 85
    .line 86
    invoke-virtual {v8}, Lo0/H$d;->a()I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    invoke-virtual {p0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    sget v8, Lm0/b;->o:I

    .line 95
    .line 96
    sget-object v9, Lo0/H$d;->e:Lo0/H$d;

    .line 97
    .line 98
    invoke-virtual {v9}, Lo0/H$d;->a()I

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    invoke-virtual {p0, v8, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    sget v9, Lm0/b;->m:I

    .line 107
    .line 108
    invoke-virtual {p0, v9, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    sget v10, Lm0/b;->l:I

    .line 113
    .line 114
    invoke-virtual {p0, v10, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 119
    .line 120
    .line 121
    new-instance p0, Lo0/B$a;

    .line 122
    .line 123
    invoke-direct {p0}, Lo0/B$a;-><init>()V

    .line 124
    .line 125
    .line 126
    sget-object v10, Lo0/B$d;->c:Lo0/B$d$a;

    .line 127
    .line 128
    invoke-virtual {v10, p2}, Lo0/B$d$a;->a(F)Lo0/B$d;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p0, p2}, Lo0/B$a;->d(Lo0/B$d;)Lo0/B$a;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    sget-object p2, Lo0/B$c;->c:Lo0/B$c$a;

    .line 137
    .line 138
    invoke-virtual {p2, v6}, Lo0/B$c$a;->a(I)Lo0/B$c;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p0, p2}, Lo0/B$a;->c(Lo0/B$c;)Lo0/B$a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    sget-object p2, Lo0/j;->a:Lo0/j$b;

    .line 147
    .line 148
    invoke-virtual {p2, v0}, Lo0/j$b;->a(I)Lo0/j;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p0, p2}, Lo0/B$a;->b(Lo0/j;)Lo0/B$a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0}, Lo0/B$a;->a()Lo0/B;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    new-instance p2, Lo0/F$a;

    .line 161
    .line 162
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-direct {p2, v0}, Lo0/F$a;-><init>(Ljava/util/Set;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2, p1}, Lo0/F$a;->k(Ljava/lang/String;)Lo0/F$a;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p1, v1}, Lo0/F$a;->j(I)Lo0/F$a;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1, v3}, Lo0/F$a;->h(I)Lo0/F$a;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p1, v2}, Lo0/F$a;->i(I)Lo0/F$a;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    sget-object p2, Lo0/k;->c:Lo0/k$a;

    .line 186
    .line 187
    invoke-virtual {p2, v4}, Lo0/k$a;->a(F)Lo0/k;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {p1, v0}, Lo0/F$a;->g(Lo0/k;)Lo0/F$a;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-virtual {p2, v5}, Lo0/k$a;->a(F)Lo0/k;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p1, p2}, Lo0/F$a;->f(Lo0/k;)Lo0/F$a;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    sget-object p2, Lo0/H$d;->c:Lo0/H$d$a;

    .line 204
    .line 205
    invoke-virtual {p2, v7}, Lo0/H$d$a;->a(I)Lo0/H$d;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p1, v0}, Lo0/F$a;->d(Lo0/H$d;)Lo0/F$a;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p2, v8}, Lo0/H$d$a;->a(I)Lo0/H$d;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    invoke-virtual {p1, p2}, Lo0/F$a;->e(Lo0/H$d;)Lo0/F$a;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-virtual {p1, v9}, Lo0/F$a;->b(Z)Lo0/F$a;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p1, p0}, Lo0/F$a;->c(Lo0/B;)Lo0/F$a;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p0}, Lo0/F$a;->a()Lo0/F;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    return-object p0
.end method

.method private final h(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/G;
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lm0/b;->x:[I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p2, v0, v1, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget p2, Lm0/b;->J:I

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    sget v0, Lm0/b;->A:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v2, Lm0/b;->I:I

    .line 25
    .line 26
    invoke-virtual {p0, v2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sget v3, Lm0/b;->z:I

    .line 31
    .line 32
    sget-object v4, Lo0/H$d;->e:Lo0/H$d;

    .line 33
    .line 34
    invoke-virtual {v4}, Lo0/H$d;->a()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {p0, v3, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    sget-object v4, Lo0/H$d;->d:Lo0/H$d;

    .line 43
    .line 44
    invoke-virtual {v4}, Lo0/H$d;->a()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eq v3, v4, :cond_0

    .line 49
    .line 50
    sget v4, Lm0/b;->H:I

    .line 51
    .line 52
    const/high16 v5, 0x3f000000    # 0.5f

    .line 53
    .line 54
    invoke-virtual {p0, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    sget v5, Lm0/b;->G:I

    .line 59
    .line 60
    const/16 v6, 0x258

    .line 61
    .line 62
    invoke-virtual {p0, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    sget v7, Lm0/b;->E:I

    .line 67
    .line 68
    invoke-virtual {p0, v7, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    sget v8, Lm0/b;->F:I

    .line 73
    .line 74
    invoke-virtual {p0, v8, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    sget v8, Lm0/b;->D:I

    .line 79
    .line 80
    sget-object v9, Lo0/H;->i:Lo0/k;

    .line 81
    .line 82
    invoke-virtual {v9}, Lo0/k;->a()F

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    invoke-virtual {p0, v8, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    sget v9, Lm0/b;->C:I

    .line 91
    .line 92
    sget-object v10, Lo0/H;->j:Lo0/k;

    .line 93
    .line 94
    invoke-virtual {v10}, Lo0/k;->a()F

    .line 95
    .line 96
    .line 97
    move-result v10

    .line 98
    invoke-virtual {p0, v9, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    sget v10, Lm0/b;->B:I

    .line 103
    .line 104
    sget-object v11, Lo0/B$c;->d:Lo0/B$c;

    .line 105
    .line 106
    invoke-virtual {v11}, Lo0/B$c;->a()I

    .line 107
    .line 108
    .line 109
    move-result v11

    .line 110
    invoke-virtual {p0, v10, v11}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 111
    .line 112
    .line 113
    move-result v10

    .line 114
    sget v11, Lm0/b;->y:I

    .line 115
    .line 116
    invoke-virtual {p0, v11, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    .line 122
    .line 123
    new-instance p0, Lo0/B$a;

    .line 124
    .line 125
    invoke-direct {p0}, Lo0/B$a;-><init>()V

    .line 126
    .line 127
    .line 128
    sget-object v11, Lo0/B$d;->c:Lo0/B$d$a;

    .line 129
    .line 130
    invoke-virtual {v11, v4}, Lo0/B$d$a;->a(F)Lo0/B$d;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    invoke-virtual {p0, v4}, Lo0/B$a;->d(Lo0/B$d;)Lo0/B$a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    sget-object v4, Lo0/B$c;->c:Lo0/B$c$a;

    .line 139
    .line 140
    invoke-virtual {v4, v10}, Lo0/B$c$a;->a(I)Lo0/B$c;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {p0, v4}, Lo0/B$a;->c(Lo0/B$c;)Lo0/B$a;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    sget-object v4, Lo0/j;->a:Lo0/j$b;

    .line 149
    .line 150
    invoke-virtual {v4, v1}, Lo0/j$b;->a(I)Lo0/j;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {p0, v1}, Lo0/B$a;->b(Lo0/j;)Lo0/B$a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0}, Lo0/B$a;->a()Lo0/B;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    sget-object v1, Lo0/z;->a:Lo0/z;

    .line 171
    .line 172
    const-string v4, "packageName"

    .line 173
    .line 174
    invoke-static {p1, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-direct {v1, p1, v0}, Lo0/z;->b(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/ComponentName;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    new-instance v0, Lo0/G$a;

    .line 182
    .line 183
    invoke-static {}, Li4/M;->b()Ljava/util/Set;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    new-instance v4, Landroid/content/Intent;

    .line 188
    .line 189
    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v4, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    const-string v4, "Intent().setComponent(pl\u2026eholderActivityClassName)"

    .line 197
    .line 198
    invoke-static {p1, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-direct {v0, v1, p1}, Lo0/G$a;-><init>(Ljava/util/Set;Landroid/content/Intent;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, p2}, Lo0/G$a;->j(Ljava/lang/String;)Lo0/G$a;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p1, v5}, Lo0/G$a;->h(I)Lo0/G$a;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p1, v7}, Lo0/G$a;->f(I)Lo0/G$a;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p1, v6}, Lo0/G$a;->g(I)Lo0/G$a;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    sget-object p2, Lo0/k;->c:Lo0/k$a;

    .line 221
    .line 222
    invoke-virtual {p2, v8}, Lo0/k$a;->a(F)Lo0/k;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p1, v0}, Lo0/G$a;->e(Lo0/k;)Lo0/G$a;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p2, v9}, Lo0/k$a;->a(F)Lo0/k;

    .line 231
    .line 232
    .line 233
    move-result-object p2

    .line 234
    invoke-virtual {p1, p2}, Lo0/G$a;->d(Lo0/k;)Lo0/G$a;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-virtual {p1, v2}, Lo0/G$a;->i(Z)Lo0/G$a;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    sget-object p2, Lo0/H$d;->c:Lo0/H$d$a;

    .line 243
    .line 244
    invoke-virtual {p2, v3}, Lo0/H$d$a;->a(I)Lo0/H$d;

    .line 245
    .line 246
    .line 247
    move-result-object p2

    .line 248
    invoke-virtual {p1, p2}, Lo0/G$a;->c(Lo0/H$d;)Lo0/G$a;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p1, p0}, Lo0/G$a;->b(Lo0/B;)Lo0/G$a;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-virtual {p0}, Lo0/G$a;->a()Lo0/G;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    return-object p0

    .line 261
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 262
    .line 263
    const-string p1, "Never is not a valid configuration for Placeholder activities. Please use FINISH_ALWAYS or FINISH_ADJACENT instead or refer to the current API"

    .line 264
    .line 265
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    throw p0
.end method


# virtual methods
.method public final e(Landroid/content/Context;I)Ljava/util/Set;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/Set<",
            "Lo0/r;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    :try_start_0
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v0, "resources.getXml(staticRuleResourceId)"

    .line 16
    .line 17
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/util/HashSet;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->next()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    move-object v4, v1

    .line 34
    move-object v5, v4

    .line 35
    move-object v6, v5

    .line 36
    :goto_0
    const/4 v7, 0x1

    .line 37
    if-eq v3, v7, :cond_d

    .line 38
    .line 39
    const/4 v7, 0x3

    .line 40
    if-ne v3, v7, :cond_0

    .line 41
    .line 42
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-le v3, v2, :cond_d

    .line 47
    .line 48
    :cond_0
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getEventType()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    const/4 v7, 0x2

    .line 53
    if-ne v3, v7, :cond_c

    .line 54
    .line 55
    const-string v3, "split-config"

    .line 56
    .line 57
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    invoke-static {v3, v7}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    goto/16 :goto_6

    .line 68
    .line 69
    :cond_1
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    if-eqz v3, :cond_b

    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    sparse-switch v7, :sswitch_data_0

    .line 80
    .line 81
    .line 82
    goto/16 :goto_5

    .line 83
    .line 84
    :sswitch_0
    const-string v7, "SplitPlaceholderRule"

    .line 85
    .line 86
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-nez v3, :cond_2

    .line 91
    .line 92
    goto/16 :goto_5

    .line 93
    .line 94
    :cond_2
    invoke-direct {p0, p1, p2}, Lo0/z;->h(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/G;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-direct {p0, v0, v3}, Lo0/z;->a(Ljava/util/HashSet;Lo0/r;)V

    .line 99
    .line 100
    .line 101
    move-object v4, v1

    .line 102
    move-object v5, v4

    .line 103
    :goto_1
    move-object v6, v3

    .line 104
    goto/16 :goto_5

    .line 105
    .line 106
    :sswitch_1
    const-string v7, "ActivityRule"

    .line 107
    .line 108
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-nez v3, :cond_3

    .line 113
    .line 114
    goto/16 :goto_5

    .line 115
    .line 116
    :cond_3
    invoke-direct {p0, p1, p2}, Lo0/z;->d(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/b;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-direct {p0, v0, v3}, Lo0/z;->a(Ljava/util/HashSet;Lo0/r;)V

    .line 121
    .line 122
    .line 123
    move-object v5, v1

    .line 124
    move-object v6, v5

    .line 125
    :goto_2
    move-object v4, v3

    .line 126
    goto/16 :goto_5

    .line 127
    .line 128
    :sswitch_2
    const-string v7, "SplitPairFilter"

    .line 129
    .line 130
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-nez v3, :cond_4

    .line 135
    .line 136
    goto :goto_5

    .line 137
    :cond_4
    if-eqz v5, :cond_5

    .line 138
    .line 139
    invoke-direct {p0, p1, p2}, Lo0/z;->f(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/E;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    invoke-virtual {v5, v3}, Lo0/F;->o(Lo0/E;)Lo0/F;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-direct {p0, v0, v3}, Lo0/z;->a(Ljava/util/HashSet;Lo0/r;)V

    .line 151
    .line 152
    .line 153
    :goto_3
    move-object v5, v3

    .line 154
    goto :goto_5

    .line 155
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 156
    .line 157
    const-string p1, "Found orphaned SplitPairFilter outside of SplitPairRule"

    .line 158
    .line 159
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    throw p0

    .line 163
    :sswitch_3
    const-string v7, "SplitPairRule"

    .line 164
    .line 165
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    if-nez v3, :cond_6

    .line 170
    .line 171
    goto :goto_5

    .line 172
    :cond_6
    invoke-direct {p0, p1, p2}, Lo0/z;->g(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/F;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-direct {p0, v0, v3}, Lo0/z;->a(Ljava/util/HashSet;Lo0/r;)V

    .line 177
    .line 178
    .line 179
    move-object v4, v1

    .line 180
    move-object v6, v4

    .line 181
    goto :goto_3

    .line 182
    :sswitch_4
    const-string v7, "ActivityFilter"

    .line 183
    .line 184
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-nez v3, :cond_7

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :cond_7
    if-nez v4, :cond_9

    .line 192
    .line 193
    if-eqz v6, :cond_8

    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 197
    .line 198
    const-string p1, "Found orphaned ActivityFilter"

    .line 199
    .line 200
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    throw p0

    .line 204
    :cond_9
    :goto_4
    invoke-direct {p0, p1, p2}, Lo0/z;->c(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)Lo0/a;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    if-eqz v4, :cond_a

    .line 209
    .line 210
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    invoke-virtual {v4, v3}, Lo0/b;->d(Lo0/a;)Lo0/b;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-direct {p0, v0, v3}, Lo0/z;->a(Ljava/util/HashSet;Lo0/r;)V

    .line 218
    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_a
    if-eqz v6, :cond_b

    .line 222
    .line 223
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    invoke-virtual {v6, v3}, Lo0/G;->o(Lo0/a;)Lo0/G;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-direct {p0, v0, v3}, Lo0/z;->a(Ljava/util/HashSet;Lo0/r;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :cond_b
    :goto_5
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->next()I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :cond_c
    :goto_6
    invoke-interface {p2}, Landroid/content/res/XmlResourceParser;->next()I

    .line 242
    .line 243
    .line 244
    move-result v3

    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :cond_d
    return-object v0

    .line 248
    :catch_0
    return-object v1

    .line 249
    :sswitch_data_0
    .sparse-switch
        0x1e7baf87 -> :sswitch_4
        0x1f056610 -> :sswitch_3
        0x5e21258c -> :sswitch_2
        0x6ae032cb -> :sswitch_1
        0x7a3f98b5 -> :sswitch_0
    .end sparse-switch
.end method
