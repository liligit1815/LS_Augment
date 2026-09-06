.class public Lx1/Z;
.super Ljava/lang/Object;
.source "ScreenUtil.java"


# static fields
.field public static i:Ljava/lang/String;

.field private static j:Z


# instance fields
.field private volatile a:I

.field private volatile b:I

.field private c:Lcom/android/launcher3/M5;

.field private d:Lcom/android/launcher3/M5;

.field private e:Lcom/android/launcher3/M5;

.field private volatile f:Z

.field private g:I

.field private h:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/Workspace;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lx1/Z;->a:I

    .line 6
    .line 7
    iput v0, p0, Lx1/Z;->b:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lx1/Z;->f:Z

    .line 11
    .line 12
    iput v0, p0, Lx1/Z;->g:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lx1/Z;->k(Lcom/android/launcher3/Workspace;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lx1/Z;->j(Lcom/android/launcher3/Workspace;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private k(Lcom/android/launcher3/Workspace;)V
    .locals 4

    .line 1
    const-string v0, "launcher.default_screen_id"

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "launcher.default_screen"

    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iput v1, p0, Lx1/Z;->b:I

    .line 19
    .line 20
    iget v1, p0, Lx1/Z;->b:I

    .line 21
    .line 22
    if-ne v1, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget v1, v1, Lcom/android/launcher3/r4;->a:I

    .line 33
    .line 34
    iput v1, p0, Lx1/Z;->b:I

    .line 35
    .line 36
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iput v1, p0, Lx1/Z;->a:I
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception v1

    .line 52
    invoke-virtual {v1}, Ljava/lang/ClassCastException;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-wide/16 v1, -0x1

    .line 64
    .line 65
    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    long-to-int p1, v0

    .line 70
    iput p1, p0, Lx1/Z;->a:I

    .line 71
    .line 72
    return-void
.end method

.method public static m()Z
    .locals 1

    .line 1
    sget-boolean v0, Lx1/Z;->j:Z

    .line 2
    .line 3
    return v0
.end method

.method public static o()Z
    .locals 2

    .line 1
    const-string v0, "default_effect_smooth"

    .line 2
    .line 3
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method private r(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "saveScreenValue : "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lx1/Z;->b:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, "-"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v1, p0, Lx1/Z;->a:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "ScreenUtil"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    const-string v0, "launcher.default_screen_id"

    .line 44
    .line 45
    iget v1, p0, Lx1/Z;->a:I

    .line 46
    .line 47
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    const-string v0, "launcher.default_screen"

    .line 51
    .line 52
    iget p0, p0, Lx1/Z;->b:I

    .line 53
    .line 54
    invoke-interface {p1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 55
    .line 56
    .line 57
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private v(Ljava/lang/String;Lcom/android/launcher3/Workspace;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Lx1/Z;->g(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/M5;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "ScreenUtil"

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string p0, "showEffectInEffectView not in effect"

    .line 14
    .line 15
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x1

    .line 24
    if-ne v0, v2, :cond_1

    .line 25
    .line 26
    const-string p0, "showEffectInEffectView page is one do nothing!"

    .line 27
    .line 28
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-boolean v0, p0, Lx1/Z;->f:Z

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iput-object p1, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 37
    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string p2, "showEffectInEffectView page playing effect preview!"

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    sput-object p1, Lx1/Z;->i:Ljava/lang/String;

    .line 62
    .line 63
    iput-boolean v2, p0, Lx1/Z;->f:Z

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, p0, Lx1/Z;->g:I

    .line 70
    .line 71
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    sub-int/2addr v0, v2

    .line 76
    if-eq p1, v0, :cond_3

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    const/4 v2, -0x1

    .line 80
    :goto_0
    add-int/2addr p1, v2

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v2, "showEffectInEffectView currentPage !"

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget p0, p0, Lx1/Z;->g:I

    .line 92
    .line 93
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string p0, "/"

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, p1}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 112
    .line 113
    .line 114
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/Workspace;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "launcher.default_screen_id"

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const-string v1, "ScreenUtil"

    .line 17
    .line 18
    if-ne v0, v2, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v3, "launcher.default_screen"

    .line 29
    .line 30
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-ne v0, v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget v0, v0, Lcom/android/launcher3/r4;->a:I

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lx1/Z;->a:I

    .line 63
    .line 64
    iget v0, p0, Lx1/Z;->a:I

    .line 65
    .line 66
    if-ne v0, v2, :cond_1

    .line 67
    .line 68
    const-string v0, "no id or index was found use default"

    .line 69
    .line 70
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Lx1/Z;->a:I

    .line 79
    .line 80
    :cond_1
    iget v0, p0, Lx1/Z;->a:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput v0, p0, Lx1/Z;->b:I

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-direct {p0, p1}, Lx1/Z;->r(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    iput v3, p0, Lx1/Z;->b:I

    .line 105
    .line 106
    iget v3, p0, Lx1/Z;->b:I

    .line 107
    .line 108
    if-ne v3, v2, :cond_3

    .line 109
    .line 110
    move v0, v2

    .line 111
    :cond_3
    iput v0, p0, Lx1/Z;->a:I

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p0, v0}, Lx1/Z;->r(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    iget v0, p0, Lx1/Z;->a:I

    .line 125
    .line 126
    if-ne v0, v2, :cond_4

    .line 127
    .line 128
    const-string v0, "saved screenId was invalid ,use saved index"

    .line 129
    .line 130
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p1}, Lx1/Z;->a(Lcom/android/launcher3/Workspace;)V

    .line 134
    .line 135
    .line 136
    :cond_4
    return-void
.end method

.method public b(Lcom/android/launcher3/Workspace;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getScreenOrder()Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lx1/Z;->a(Lcom/android/launcher3/Workspace;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p1, p0}, Lcom/android/launcher3/Workspace;->u3(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public c(Lcom/android/launcher3/Workspace;Lcom/android/launcher3/V3;)Lcom/android/launcher3/util/z0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->O0()Lcom/android/launcher3/util/z0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->A0()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public d()Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    iget v1, p0, Lx1/Z;->b:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget p0, p0, Lx1/Z;->a:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public e(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/Z;->e:Lcom/android/launcher3/M5;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/android/launcher3/M5;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/Z;->d:Lcom/android/launcher3/M5;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lx1/Z;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lx1/Z;->c:Lcom/android/launcher3/M5;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    iget-object p0, p0, Lx1/Z;->e:Lcom/android/launcher3/M5;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const-string v0, "default_effect_smooth"

    .line 14
    .line 15
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Lx1/Z;->e:Lcom/android/launcher3/M5;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string v0, "default_effect_cross"

    .line 27
    .line 28
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    new-instance p0, Lcom/android/launcher3/M5$c;

    .line 37
    .line 38
    invoke-direct {p0, p1}, Lcom/android/launcher3/M5$c;-><init>(Lcom/android/launcher3/V4;)V

    .line 39
    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    const-string v0, "default_effect_wave"

    .line 43
    .line 44
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    new-instance p0, Lcom/android/launcher3/M5$e;

    .line 53
    .line 54
    invoke-direct {p0, p1}, Lcom/android/launcher3/M5$e;-><init>(Lcom/android/launcher3/V4;)V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_4
    const-string v0, "default_effect_outbox"

    .line 59
    .line 60
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    new-instance p0, Lcom/android/launcher3/M5$a;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/M5$a;-><init>(Lcom/android/launcher3/V4;Z)V

    .line 72
    .line 73
    .line 74
    return-object p0

    .line 75
    :cond_5
    const-string v0, "default_effect_inbox"

    .line 76
    .line 77
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_6

    .line 84
    .line 85
    new-instance p0, Lcom/android/launcher3/M5$a;

    .line 86
    .line 87
    const/4 v0, 0x1

    .line 88
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/M5$a;-><init>(Lcom/android/launcher3/V4;Z)V

    .line 89
    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_6
    const-string v0, "default_effect_fanlight"

    .line 93
    .line 94
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_7

    .line 101
    .line 102
    new-instance p0, Lcom/android/launcher3/M5$d;

    .line 103
    .line 104
    invoke-direct {p0, p1}, Lcom/android/launcher3/M5$d;-><init>(Lcom/android/launcher3/V4;)V

    .line 105
    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_7
    iget-object p0, p0, Lx1/Z;->e:Lcom/android/launcher3/M5;

    .line 109
    .line 110
    return-object p0
.end method

.method h(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "com.zte.mifavor.launcher.action.ADD_WIDGET"

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public i(Landroid/content/Context;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lx1/Z;->h(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    instance-of p0, p3, Lcom/android/launcher3/widget/z0;

    .line 10
    .line 11
    if-eqz p0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/android/launcher3/Workspace;->getAllShortcutAndWidgetContainersChildViewList()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    instance-of v0, v0, Lcom/android/launcher3/model/data/A;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    check-cast p2, Lcom/android/launcher3/model/data/A;

    .line 46
    .line 47
    move-object v0, p3

    .line 48
    check-cast v0, Lcom/android/launcher3/widget/z0;

    .line 49
    .line 50
    iget-object p2, p2, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 51
    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    iget-object v0, v0, Lcom/android/launcher3/W4;->k:Landroid/content/ComponentName;

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    return p0

    .line 64
    :cond_2
    return p1
.end method

.method public j(Lcom/android/launcher3/Workspace;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const-string v2, "default_effect_id"

    .line 11
    .line 12
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sput-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v1, v1, Lcom/android/launcher3/r4;->b:Ljava/lang/String;

    .line 33
    .line 34
    sput-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 35
    .line 36
    :cond_0
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    const-string v0, "default_effect_smooth"

    .line 45
    .line 46
    sput-object v0, Lx1/Z;->i:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 60
    .line 61
    .line 62
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v1, "initDefaultEffect"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    sget-object v1, Lx1/Z;->i:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const-string v1, "ScreenUtil"

    .line 82
    .line 83
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    sget-object v0, Lx1/Z;->i:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, p1, v0}, Lx1/Z;->s(Lcom/android/launcher3/V4;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Lcom/android/launcher3/M5$b;

    .line 92
    .line 93
    invoke-direct {v0, p1}, Lcom/android/launcher3/M5$b;-><init>(Lcom/android/launcher3/V4;)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lx1/Z;->e:Lcom/android/launcher3/M5;

    .line 97
    .line 98
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/Z;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public n(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "launcher.default_screen_id"

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "launcher.default_screen"

    .line 17
    .line 18
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eq p0, v1, :cond_0

    .line 23
    .line 24
    if-ne p1, v1, :cond_1

    .line 25
    .line 26
    :cond_0
    if-nez p1, :cond_2

    .line 27
    .line 28
    :cond_1
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_2
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public p(Lcom/android/launcher3/Workspace;Ljava/lang/String;ZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onEffectApplied "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "-"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    const-string v0, "ScreenUtil"

    .line 33
    .line 34
    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-static {p3}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    const-string v0, "default_effect_id"

    .line 50
    .line 51
    invoke-interface {p3, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 56
    .line 57
    .line 58
    iget-object p3, p0, Lx1/Z;->c:Lcom/android/launcher3/M5;

    .line 59
    .line 60
    invoke-virtual {p0, p3}, Lx1/Z;->t(Lcom/android/launcher3/M5;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lx1/Z;->s(Lcom/android/launcher3/V4;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sput-boolean p4, Lx1/Z;->j:Z

    .line 67
    .line 68
    invoke-direct {p0, p2, p1}, Lx1/Z;->v(Ljava/lang/String;Lcom/android/launcher3/Workspace;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public q(Lcom/android/launcher3/Workspace;)V
    .locals 4

    .line 1
    iget v0, p0, Lx1/Z;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    iput-boolean v2, p0, Lx1/Z;->f:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lx1/Z;->g(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/M5;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lx1/Z;->g:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput-object v1, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 26
    .line 27
    iget v0, p0, Lx1/Z;->g:I

    .line 28
    .line 29
    iget v3, p0, Lx1/Z;->a:I

    .line 30
    .line 31
    invoke-virtual {p1, v3}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-ne v0, v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->r2()V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    const/4 v0, -0x1

    .line 41
    iput v0, p0, Lx1/Z;->g:I

    .line 42
    .line 43
    :cond_2
    iget-boolean v0, p0, Lx1/Z;->f:Z

    .line 44
    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v3, Lx1/Z;->i:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    iget-object v0, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 66
    .line 67
    invoke-direct {p0, v0, p1}, Lx1/Z;->v(Ljava/lang/String;Lcom/android/launcher3/Workspace;)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lx1/Z;->h:Ljava/lang/String;

    .line 71
    .line 72
    :cond_3
    sput-boolean v2, Lx1/Z;->j:Z

    .line 73
    .line 74
    return-void
.end method

.method public s(Lcom/android/launcher3/V4;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "default_effect_smooth"

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lx1/Z;->e:Lcom/android/launcher3/M5;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v0, "default_effect_cross"

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance p2, Lcom/android/launcher3/M5$c;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Lcom/android/launcher3/M5$c;-><init>(Lcom/android/launcher3/V4;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-string v0, "default_effect_wave"

    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    new-instance p2, Lcom/android/launcher3/M5$e;

    .line 41
    .line 42
    invoke-direct {p2, p1}, Lcom/android/launcher3/M5$e;-><init>(Lcom/android/launcher3/V4;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    const-string v0, "default_effect_outbox"

    .line 50
    .line 51
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    new-instance p2, Lcom/android/launcher3/M5$a;

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-direct {p2, p1, v0}, Lcom/android/launcher3/M5$a;-><init>(Lcom/android/launcher3/V4;Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    const-string v0, "default_effect_inbox"

    .line 68
    .line 69
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    new-instance p2, Lcom/android/launcher3/M5$a;

    .line 76
    .line 77
    const/4 v0, 0x1

    .line 78
    invoke-direct {p2, p1, v0}, Lcom/android/launcher3/M5$a;-><init>(Lcom/android/launcher3/V4;Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p2}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    const-string v0, "default_effect_fanlight"

    .line 86
    .line 87
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_5

    .line 92
    .line 93
    new-instance p2, Lcom/android/launcher3/M5$d;

    .line 94
    .line 95
    invoke-direct {p2, p1}, Lcom/android/launcher3/M5$d;-><init>(Lcom/android/launcher3/V4;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p2}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    const/4 p1, 0x0

    .line 103
    invoke-virtual {p0, p1}, Lx1/Z;->u(Lcom/android/launcher3/M5;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public t(Lcom/android/launcher3/M5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/Z;->d:Lcom/android/launcher3/M5;

    .line 2
    .line 3
    return-void
.end method

.method public u(Lcom/android/launcher3/M5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lx1/Z;->c:Lcom/android/launcher3/M5;

    .line 2
    .line 3
    return-void
.end method

.method public w(Lcom/android/launcher3/Workspace;I)Z
    .locals 4

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p2, v0, :cond_1

    .line 3
    .line 4
    const v1, 0x7fffffff

    .line 5
    .line 6
    .line 7
    if-ne p2, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    goto :goto_1

    .line 15
    :cond_1
    :goto_0
    iget v1, p0, Lx1/Z;->a:I

    .line 16
    .line 17
    if-ne v1, v0, :cond_2

    .line 18
    .line 19
    iget p2, p0, Lx1/Z;->b:I

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    goto :goto_1

    .line 26
    :cond_2
    invoke-virtual {p1, v1}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v3, "updateDefaultPage"

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v3, "/"

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "ScreenUtil"

    .line 56
    .line 57
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    const/16 v2, -0xc9

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    if-ne v1, v2, :cond_3

    .line 64
    .line 65
    return v3

    .line 66
    :cond_3
    if-eq v1, v0, :cond_4

    .line 67
    .line 68
    if-ne p2, v0, :cond_5

    .line 69
    .line 70
    :cond_4
    invoke-virtual {p1, v3}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    move p2, v3

    .line 75
    :cond_5
    iput p2, p0, Lx1/Z;->b:I

    .line 76
    .line 77
    iput v1, p0, Lx1/Z;->a:I

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-direct {p0, p1}, Lx1/Z;->r(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    const/4 p0, 0x1

    .line 87
    return p0
.end method

.method public x(Lcom/android/launcher3/Workspace;)V
    .locals 1

    .line 1
    iget v0, p0, Lx1/Z;->a:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lx1/Z;->g:I

    .line 8
    .line 9
    return-void
.end method
