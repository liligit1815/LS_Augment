.class public final Le0/e;
.super Ljava/lang/Object;
.source "SavedStateRegistryController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le0/e$a;
    }
.end annotation


# static fields
.field public static final d:Le0/e$a;


# instance fields
.field private final a:Le0/f;

.field private final b:Le0/d;

.field private c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Le0/e$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Le0/e$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Le0/e;->d:Le0/e$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Le0/f;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le0/e;->a:Le0/f;

    .line 3
    new-instance p1, Le0/d;

    invoke-direct {p1}, Le0/d;-><init>()V

    iput-object p1, p0, Le0/e;->b:Le0/d;

    return-void
.end method

.method public synthetic constructor <init>(Le0/f;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Le0/e;-><init>(Le0/f;)V

    return-void
.end method

.method public static final a(Le0/f;)Le0/e;
    .locals 1

    .line 1
    sget-object v0, Le0/e;->d:Le0/e$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Le0/e$a;->a(Le0/f;)Le0/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final b()Le0/d;
    .locals 0

    .line 1
    iget-object p0, p0, Le0/e;->b:Le0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()V
    .locals 3

    .line 1
    iget-object v0, p0, Le0/e;->a:Le0/f;

    .line 2
    .line 3
    invoke-interface {v0}, LW/d;->getLifecycle()Landroidx/lifecycle/g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/lifecycle/g;->b()Landroidx/lifecycle/g$b;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Landroidx/lifecycle/g$b;->h:Landroidx/lifecycle/g$b;

    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    new-instance v1, Le0/b;

    .line 16
    .line 17
    iget-object v2, p0, Le0/e;->a:Le0/f;

    .line 18
    .line 19
    invoke-direct {v1, v2}, Le0/b;-><init>(Le0/f;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/lifecycle/g;->a(LW/c;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Le0/e;->b:Le0/d;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Le0/d;->e(Landroidx/lifecycle/g;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Le0/e;->c:Z

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 35
    .line 36
    const-string v0, "Restarter must be created only during owner\'s initialization stage"

    .line 37
    .line 38
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0
.end method

.method public final d(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Le0/e;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Le0/e;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Le0/e;->a:Le0/f;

    .line 9
    .line 10
    invoke-interface {v0}, LW/d;->getLifecycle()Landroidx/lifecycle/g;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroidx/lifecycle/g;->b()Landroidx/lifecycle/g$b;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Landroidx/lifecycle/g$b;->j:Landroidx/lifecycle/g$b;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroidx/lifecycle/g$b;->c(Landroidx/lifecycle/g$b;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Le0/e;->b:Le0/d;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Le0/d;->f(Landroid/os/Bundle;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string p1, "performRestore cannot be called when owner is "

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroidx/lifecycle/g;->b()Landroidx/lifecycle/g$b;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public final e(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "outBundle"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Le0/e;->b:Le0/d;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Le0/d;->g(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
