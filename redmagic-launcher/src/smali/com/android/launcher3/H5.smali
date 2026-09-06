.class public abstract Lcom/android/launcher3/H5;
.super Ljava/lang/Object;
.source "ResourceManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/H5$d;,
        Lcom/android/launcher3/H5$k;,
        Lcom/android/launcher3/H5$a;,
        Lcom/android/launcher3/H5$g;,
        Lcom/android/launcher3/H5$j;,
        Lcom/android/launcher3/H5$b;,
        Lcom/android/launcher3/H5$e;,
        Lcom/android/launcher3/H5$h;,
        Lcom/android/launcher3/H5$i;,
        Lcom/android/launcher3/H5$f;,
        Lcom/android/launcher3/H5$c;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/Object;

.field private static volatile b:Lcom/android/launcher3/H5;

.field private static volatile c:Lcom/android/launcher3/resource/B;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/H5;->a:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static D1(Landroid/content/Context;Landroid/os/UserHandle;)J
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, LD1/t;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 14
    .line 15
    .line 16
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return-wide p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "transUserHandle exception:"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "R-Loader"

    .line 41
    .line 42
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    const-wide/16 p0, 0x0

    .line 46
    .line 47
    return-wide p0
.end method

.method public static E()Lcom/android/launcher3/H5$d;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->h()Lcom/android/launcher3/H5$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static T(Landroid/content/Context;)Lcom/android/launcher3/H5;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/H5;->b:Lcom/android/launcher3/H5;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/H5;->a:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/android/launcher3/H5;->b:Lcom/android/launcher3/H5;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "R-Loader"

    .line 13
    .line 14
    const-string v2, "ResourceManager instance "

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->y(Landroid/content/Context;)Lcom/android/launcher3/resource/g0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sput-object p0, Lcom/android/launcher3/H5;->b:Lcom/android/launcher3/H5;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v0

    .line 29
    goto :goto_2

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0

    .line 32
    :cond_1
    :goto_2
    sget-object p0, Lcom/android/launcher3/H5;->b:Lcom/android/launcher3/H5;

    .line 33
    .line 34
    return-object p0
.end method

.method public static U()Lcom/android/launcher3/H5;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/H5;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/H5;->b:Lcom/android/launcher3/H5;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw v1
.end method

.method public static W()Lcom/android/launcher3/resource/B;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/H5;->c:Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/android/launcher3/resource/B;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/android/launcher3/H5;->c:Lcom/android/launcher3/resource/B;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/android/launcher3/resource/B;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/android/launcher3/resource/B;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/android/launcher3/H5;->c:Lcom/android/launcher3/resource/B;

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
    sget-object v0, Lcom/android/launcher3/H5;->c:Lcom/android/launcher3/resource/B;

    .line 27
    .line 28
    return-object v0
.end method

.method public static a1(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;Z)V
    .locals 4

    .line 1
    const-string v0, "R-Loader"

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "pendShortcutExtraInfo shortcutInfo is null!!!!"

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    new-instance v1, Landroid/os/PersistableBundle;

    .line 18
    .line 19
    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-string v3, "mExtras"

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    const-string v2, "pendShortcutExtraInfo IllegalAccessException to mExtras"

    .line 41
    .line 42
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_1
    const-string v2, "pendShortcutExtraInfo no mExtras field"

    .line 47
    .line 48
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    invoke-virtual {v1, p1, p2}, Landroid/os/PersistableBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    new-instance p2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v2, "pendShortcutExtraInfo value "

    .line 60
    .line 61
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p1}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, "-"

    .line 72
    .line 73
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public static j0(Landroid/content/pm/ShortcutInfo;Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const v1, -0x59b4c91a

    .line 10
    .line 11
    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const v1, -0x4b53f950

    .line 15
    .line 16
    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "needShowBadge"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string v0, "isCustomApp"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 38
    :goto_1
    if-nez p0, :cond_3

    .line 39
    .line 40
    return v0

    .line 41
    :cond_3
    invoke-virtual {p0, p1, v0}, Landroid/os/PersistableBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public static q(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/resource/o0;->Y(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract A()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract A0(Landroid/content/ComponentName;)Z
.end method

.method public abstract A1()V
.end method

.method public abstract B()Lcom/android/launcher3/H5$c;
.end method

.method public abstract B0(Landroid/content/ComponentName;)Z
.end method

.method public abstract B1()V
.end method

.method public abstract C()Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "LN1/e;",
            ">;"
        }
    .end annotation
.end method

.method public abstract C0()Z
.end method

.method public abstract C1()V
.end method

.method public abstract D()Ljava/lang/String;
.end method

.method public abstract D0(Lcom/android/launcher3/P2;Landroid/content/ComponentName;)Z
.end method

.method public abstract E0()Z
.end method

.method public abstract E1(Landroid/content/Context;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/util/E;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract F()Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Landroid/content/res/Resources;",
            ">;"
        }
    .end annotation
.end method

.method public abstract F0(Ljava/lang/String;)Z
.end method

.method public abstract G(Ljava/lang/String;)Ljava/io/InputStream;
.end method

.method public abstract G0()Z
.end method

.method public abstract H()Lcom/android/launcher3/b0;
.end method

.method public abstract H0()Z
.end method

.method public abstract I()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;"
        }
    .end annotation
.end method

.method public abstract I0()Z
.end method

.method public abstract J()Z
.end method

.method public abstract J0()Z
.end method

.method public abstract K(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
.end method

.method public abstract K0()Z
.end method

.method public abstract L(Landroid/content/ComponentName;Landroid/content/Context;)Ljava/lang/String;
.end method

.method public abstract L0()Z
.end method

.method public abstract M()Landroid/graphics/Bitmap;
.end method

.method public abstract M0()Z
.end method

.method public abstract N()Landroid/graphics/drawable/Drawable;
.end method

.method public abstract N0()Z
.end method

.method public abstract O()Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract O0()Z
.end method

.method public abstract P(I)Ljava/lang/String;
.end method

.method public abstract P0()Z
.end method

.method public abstract Q(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract Q0()Z
.end method

.method public abstract R()Landroid/graphics/drawable/Drawable;
.end method

.method public abstract R0()Z
.end method

.method public abstract S()Landroid/content/Intent;
.end method

.method public abstract S0()V
.end method

.method public abstract T0()V
.end method

.method public abstract U0(Landroid/content/Context;)V
.end method

.method public abstract V()Z
.end method

.method public abstract V0(Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/os/UserHandle;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract W0()Z
.end method

.method public abstract X()Ljava/lang/String;
.end method

.method public abstract X0()Z
.end method

.method public abstract Y()Lcom/android/launcher3/H5$g;
.end method

.method public abstract Y0()V
.end method

.method public abstract Z(Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public varargs abstract Z0(Landroid/os/UserHandle;I[Ljava/lang/String;)V
.end method

.method public abstract a(Lcom/android/launcher3/H5$b;)V
.end method

.method public abstract a0()Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "LN1/e;",
            ">;"
        }
    .end annotation
.end method

.method public abstract b(Landroid/content/ComponentName;)V
.end method

.method public abstract b0(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
.end method

.method public abstract b1(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract c(I)V
.end method

.method public abstract c0(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
.end method

.method public abstract c1()V
.end method

.method public abstract d(Ljava/lang/String;)V
.end method

.method public abstract d0()Landroid/graphics/drawable/Drawable;
.end method

.method public abstract d1(Ljava/lang/String;)V
.end method

.method public abstract e(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z
.end method

.method public abstract e0(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/H5$j;",
            ">;"
        }
    .end annotation
.end method

.method public abstract e1()V
.end method

.method public abstract f(Lcom/android/launcher3/H5$c;)V
.end method

.method public abstract f0()Landroid/graphics/Bitmap;
.end method

.method public abstract f1(I)V
.end method

.method public abstract g(I)V
.end method

.method public abstract g0()Z
.end method

.method public abstract g1(Landroid/content/Context;)V
.end method

.method public abstract h()V
.end method

.method public abstract h0(Ljava/lang/String;)Landroid/graphics/Bitmap;
.end method

.method public abstract h1()V
.end method

.method public abstract i(Z)Z
.end method

.method public abstract i0(Ljava/lang/String;)Landroid/graphics/Bitmap;
.end method

.method public abstract i1(Ljava/util/HashSet;Landroid/os/UserHandle;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "LN1/e;",
            ">;",
            "Landroid/os/UserHandle;",
            ")V"
        }
    .end annotation
.end method

.method public abstract j(Lcom/android/launcher3/util/E;I)Z
.end method

.method public abstract j1(Z)V
.end method

.method public abstract k()V
.end method

.method public abstract k0()Z
.end method

.method public abstract k1(Lcom/android/launcher3/H5$a;)V
.end method

.method public abstract l()V
.end method

.method public abstract l0()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "LR1/i;",
            ">;"
        }
    .end annotation
.end method

.method public abstract l1(Z)V
.end method

.method public abstract m()V
.end method

.method public abstract m0()Z
.end method

.method public abstract m1(Lcom/android/launcher3/H5$e;)V
.end method

.method public abstract n()V
.end method

.method public abstract n0()Lcom/android/launcher3/resource/h1;
.end method

.method public abstract n1(ZZ)V
.end method

.method public abstract o(LN1/e;)V
.end method

.method public abstract o0()I
.end method

.method public abstract o1(Lcom/android/launcher3/c1$d;)V
.end method

.method public abstract p(Ljava/lang/String;LN1/e;)V
.end method

.method public abstract p0()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/H5$k;",
            ">;"
        }
    .end annotation
.end method

.method public abstract p1(IILjava/lang/String;)V
.end method

.method public abstract q0()Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract q1(Z)V
.end method

.method public abstract r(Ljava/lang/String;)V
.end method

.method public abstract r0()Landroid/graphics/Rect;
.end method

.method public abstract r1(Lcom/android/launcher3/H5$f;)V
.end method

.method public abstract s(Ljava/lang/String;)I
.end method

.method public abstract s0()Lr1/l;
.end method

.method public abstract s1()V
.end method

.method public abstract t(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;
.end method

.method public abstract t0(Lcom/android/launcher3/H5$b;)Z
.end method

.method public abstract t1(Lcom/android/launcher3/H5$h;)V
.end method

.method public abstract u()Landroid/graphics/Bitmap;
.end method

.method public abstract u0()V
.end method

.method public abstract u1(Lcom/android/launcher3/H5$i;)V
.end method

.method public abstract v(Landroid/content/Context;)V
.end method

.method public abstract v0()V
.end method

.method public abstract v1(Z)V
.end method

.method public abstract w(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract w0(Ljava/lang/String;)Z
.end method

.method public abstract w1(Z)V
.end method

.method public abstract x(Ljava/lang/String;)I
.end method

.method public abstract x0()Z
.end method

.method public abstract x1(Z)V
.end method

.method public abstract y()[I
.end method

.method public abstract y0()Z
.end method

.method public abstract y1(Lcom/android/launcher3/c1$e;)V
.end method

.method public abstract z()Z
.end method

.method public abstract z0(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z
.end method

.method public abstract z1(Ljava/lang/String;)Z
.end method
