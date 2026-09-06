.class public Lcom/android/launcher3/util/h2;
.super Ljava/lang/Object;
.source "ScreenOnTracker.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/h2$a;
    }
.end annotation


# static fields
.field public static final k:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/h2;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Lcom/android/launcher3/util/x2;

.field private final h:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/android/launcher3/util/h2$a;",
            ">;"
        }
    .end annotation
.end field

.field private i:Z

.field private final j:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/b2;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/b2;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/util/h2;->k:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    const-string v0, "com.zte.intent.action.ZTE_SCREEN_OFF"

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/util/h2;->j:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/util/x2;

    .line 16
    .line 17
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    new-instance v2, Lcom/android/launcher3/util/c2;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/android/launcher3/util/c2;-><init>(Lcom/android/launcher3/util/h2;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, p1, v1, v2}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/util/h2;->g:Lcom/android/launcher3/util/x2;

    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/android/launcher3/util/h2;->e(Lcom/android/launcher3/util/K;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/h2;Lcom/android/launcher3/util/h2$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/h2;->g(Lcom/android/launcher3/util/h2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/g2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/g2;-><init>(Lcom/android/launcher3/util/h2;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private e(Lcom/android/launcher3/util/K;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/util/h2;->i:Z

    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const-string v1, "android.intent.action.SCREEN_OFF"

    .line 7
    .line 8
    const-string v2, "android.intent.action.USER_PRESENT"

    .line 9
    .line 10
    const-string v3, "android.intent.action.SCREEN_ON"

    .line 11
    .line 12
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lx1/O;->L3()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const-string v1, "com.zte.intent.action.ZTE_SCREEN_OFF"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {}, Lx1/O;->k5()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    const-string v1, "android.intent.action.WALLPAPER_CHANGED"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/util/h2;->g:Lcom/android/launcher3/util/x2;

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    new-array v2, v2, [Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, [Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private synthetic g(Lcom/android/launcher3/util/h2$a;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/h2;->i:Z

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lcom/android/launcher3/util/h2$a;->a(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(Lcom/android/launcher3/util/h2$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/h2;->g:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method j(Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "android.intent.action.SCREEN_ON"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/util/h2;->i:Z

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/launcher3/util/h2;->d()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string v0, "android.intent.action.SCREEN_OFF"

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/android/launcher3/util/h2;->i:Z

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/launcher3/util/h2;->d()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const-string v0, "android.intent.action.USER_PRESENT"

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 44
    .line 45
    new-instance p1, Lcom/android/launcher3/util/d2;

    .line 46
    .line 47
    invoke-direct {p1}, Lcom/android/launcher3/util/d2;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const-string v0, "com.zte.intent.action.ZTE_SCREEN_OFF"

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 63
    .line 64
    new-instance p1, Lcom/android/launcher3/util/e2;

    .line 65
    .line 66
    invoke-direct {p1}, Lcom/android/launcher3/util/e2;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    const-string v0, "android.intent.action.WALLPAPER_CHANGED"

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_4

    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 82
    .line 83
    new-instance p1, Lcom/android/launcher3/util/f2;

    .line 84
    .line 85
    invoke-direct {p1}, Lcom/android/launcher3/util/f2;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    return-void
.end method

.method public n(Lcom/android/launcher3/util/h2$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/h2;->h:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
