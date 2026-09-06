.class public final Lt1/o;
.super Ljava/lang/Object;
.source "LauncherActivityCachingLogic.kt"

# interfaces
.implements Lt1/j;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lt1/j<",
        "Landroid/content/pm/LauncherActivityInfo;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Lt1/o;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lt1/o;

    .line 2
    .line 3
    invoke-direct {v0}, Lt1/o;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lt1/o;->a:Lt1/o;

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


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    check-cast p1, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/o;->l(Landroid/content/pm/LauncherActivityInfo;)Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;
    .locals 0

    .line 1
    check-cast p1, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lt1/o;->k(Landroid/content/pm/LauncherActivityInfo;Ls1/T;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d(Landroid/content/Context;Lt1/f;Ljava/lang/Object;)Ls1/d;
    .locals 0

    .line 1
    check-cast p3, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lt1/o;->n(Landroid/content/Context;Lt1/f;Landroid/content/pm/LauncherActivityInfo;)Ls1/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic e(Landroid/content/Context;Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    check-cast p2, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lt1/o;->o(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    check-cast p1, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/o;->i(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic g(Ljava/lang/Object;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    check-cast p1, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/o;->m(Landroid/content/pm/LauncherActivityInfo;)Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    check-cast p1, Landroid/content/pm/LauncherActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt1/o;->j(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public j(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/ComponentName;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "getComponentName(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public k(Landroid/content/pm/LauncherActivityInfo;Ls1/T;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "provider"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lt1/o;->i(Landroid/content/pm/LauncherActivityInfo;)Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2, p0}, Ls1/T;->m(Landroid/content/pm/ApplicationInfo;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public l(Landroid/content/pm/LauncherActivityInfo;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getLabel()Ljava/lang/CharSequence;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public m(Landroid/content/pm/LauncherActivityInfo;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    const-string p0, "info"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string p1, "getUser(...)"

    .line 11
    .line 12
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public n(Landroid/content/Context;Lt1/f;Landroid/content/pm/LauncherActivityInfo;)Ls1/d;
    .locals 5

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "cache"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "info"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Lt1/f;->v()Ls1/b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :try_start_0
    new-instance v0, Ls1/b$c;

    .line 21
    .line 22
    invoke-direct {v0}, Ls1/b$c;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p3}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "setUser(...)"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/android/launcher3/y0;->I0()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 45
    .line 46
    const/16 v2, 0x23

    .line 47
    .line 48
    if-lt v1, v2, :cond_0

    .line 49
    .line 50
    invoke-virtual {p3}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-boolean v1, v1, Landroid/content/pm/ActivityInfo;->isArchived:Z

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p1

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    const/4 v1, 0x0

    .line 63
    :goto_0
    invoke-virtual {v0, v1}, Ls1/b$c;->c(Z)Ls1/b$c;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget-object v2, Lt1/o;->a:Lt1/o;

    .line 68
    .line 69
    invoke-interface {v2, p3, p2}, Lt1/j;->b(Ljava/lang/Object;Lt1/f;)Ls1/n0;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Ls1/b$c;->d(Ls1/n0;)Ls1/b$c;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2}, Lt1/f;->w()Ls1/T;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p3}, Landroid/content/pm/LauncherActivityInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p0}, Ls1/b;->J()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-virtual {v1, p3, v2, v3}, Ls1/T;->k(Landroid/content/pm/LauncherActivityInfo;Landroid/content/pm/ComponentInfo;I)Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, v1}, Landroid/content/pm/PackageManager;->isDefaultApplicationIcon(Landroid/graphics/drawable/Drawable;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    const/4 v2, 0x0

    .line 101
    if-eqz p1, :cond_1

    .line 102
    .line 103
    const-string p1, "LauncherActivityCachingLogic"

    .line 104
    .line 105
    invoke-virtual {p3}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p3}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    new-instance v3, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v4, "loadIcon: Default app icon returned from PackageManager. component="

    .line 119
    .line 120
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, ", user="

    .line 127
    .line 128
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ljava/lang/Exception;

    .line 139
    .line 140
    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-static {p1, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 144
    .line 145
    .line 146
    invoke-virtual {p3}, Landroid/content/pm/LauncherActivityInfo;->getUser()Landroid/os/UserHandle;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    const-string p3, "getUser(...)"

    .line 151
    .line 152
    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p2, p1}, Lt1/f;->p(Landroid/os/UserHandle;)Ls1/d;

    .line 156
    .line 157
    .line 158
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    invoke-static {p0, v2}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 160
    .line 161
    .line 162
    return-object p1

    .line 163
    :cond_1
    :try_start_1
    invoke-virtual {p0, v1, v0}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    const-string p2, "createBadgedIconBitmap(...)"

    .line 168
    .line 169
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    .line 171
    .line 172
    invoke-static {p0, v2}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 173
    .line 174
    .line 175
    return-object p1

    .line 176
    :goto_1
    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 177
    :catchall_1
    move-exception p2

    .line 178
    invoke-static {p0, p1}, Ls4/a;->a(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    throw p2
.end method

.method public o(Landroid/content/Context;Landroid/content/pm/LauncherActivityInfo;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "object"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
