.class final LC2/a$b;
.super Ljava/lang/Object;
.source "DaggerRemoteUnfoldSharedComponent.java"

# interfaces
.implements LC2/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LC2/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final a:LC2/d;

.field private final b:Landroid/os/Handler;

.field private final c:LC2/a$b;

.field private d:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "LD2/f;",
            ">;"
        }
    .end annotation
.end field

.field private e:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private f:LF2/b;

.field private g:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "LF2/a$a;",
            ">;"
        }
    .end annotation
.end field

.field private h:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private i:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field

.field private j:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;"
        }
    .end annotation
.end field

.field private k:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/util/Optional<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;>;"
        }
    .end annotation
.end field

.field private l:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Landroid/hardware/display/DisplayManager;",
            ">;"
        }
    .end annotation
.end field

.field private m:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private n:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field

.field private o:LE2/d;

.field private p:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "LE2/c$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(LC2/d;Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p0, p0, LC2/a$b;->c:LC2/a$b;

    .line 4
    iput-object p1, p0, LC2/a$b;->a:LC2/d;

    .line 5
    iput-object p5, p0, LC2/a$b;->b:Landroid/os/Handler;

    .line 6
    invoke-direct/range {p0 .. p9}, LC2/a$b;->c(LC2/d;Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;)V

    return-void
.end method

.method synthetic constructor <init>(LC2/d;Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;LC2/b;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, LC2/a$b;-><init>(LC2/d;Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;)V

    return-void
.end method

.method private c(LC2/d;Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p3}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iput-object p3, p0, LC2/a$b;->d:Lf4/f;

    .line 6
    .line 7
    invoke-static {p9}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    iput-object p3, p0, LC2/a$b;->e:Lf4/f;

    .line 12
    .line 13
    invoke-static {p3}, LF2/b;->a(Lf4/f;)LF2/b;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iput-object p3, p0, LC2/a$b;->f:LF2/b;

    .line 18
    .line 19
    invoke-static {p3}, LF2/c;->b(LF2/b;)Lf4/f;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    iput-object p3, p0, LC2/a$b;->g:Lf4/f;

    .line 24
    .line 25
    invoke-static {p1}, LC2/g;->a(LC2/d;)LC2/g;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    iput-object p3, p0, LC2/a$b;->h:Lf4/f;

    .line 30
    .line 31
    invoke-static {p4}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    iput-object p3, p0, LC2/a$b;->i:Lf4/f;

    .line 36
    .line 37
    iget-object p4, p0, LC2/a$b;->h:Lf4/f;

    .line 38
    .line 39
    invoke-static {p4, p3}, Lcom/android/systemui/unfold/progress/k;->a(Lf4/f;Lf4/f;)Lcom/android/systemui/unfold/progress/k;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    iput-object p3, p0, LC2/a$b;->j:Lf4/f;

    .line 44
    .line 45
    iget-object p4, p0, LC2/a$b;->d:Lf4/f;

    .line 46
    .line 47
    iget-object p5, p0, LC2/a$b;->g:Lf4/f;

    .line 48
    .line 49
    invoke-static {p1, p4, p5, p3}, LC2/f;->a(LC2/d;Lf4/f;Lf4/f;Lf4/f;)LC2/f;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lf4/b;->c(Lf4/f;)Lf4/f;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, LC2/a$b;->k:Lf4/f;

    .line 58
    .line 59
    invoke-static {p8}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, LC2/a$b;->l:Lf4/f;

    .line 64
    .line 65
    invoke-static {p2}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, LC2/a$b;->m:Lf4/f;

    .line 70
    .line 71
    invoke-static {p7}, Lf4/d;->a(Ljava/lang/Object;)Lf4/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, LC2/a$b;->n:Lf4/f;

    .line 76
    .line 77
    iget-object p2, p0, LC2/a$b;->l:Lf4/f;

    .line 78
    .line 79
    iget-object p3, p0, LC2/a$b;->m:Lf4/f;

    .line 80
    .line 81
    invoke-static {p2, p3, p1}, LE2/d;->a(Lf4/f;Lf4/f;Lf4/f;)LE2/d;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, LC2/a$b;->o:LE2/d;

    .line 86
    .line 87
    invoke-static {p1}, LE2/e;->b(LE2/d;)Lf4/f;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, LC2/a$b;->p:Lf4/f;

    .line 92
    .line 93
    return-void
.end method


# virtual methods
.method public a()LE2/c;
    .locals 2

    .line 1
    iget-object v0, p0, LC2/a$b;->a:LC2/d;

    .line 2
    .line 3
    iget-object v1, p0, LC2/a$b;->p:Lf4/f;

    .line 4
    .line 5
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, LE2/c$a;

    .line 10
    .line 11
    iget-object p0, p0, LC2/a$b;->b:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, LC2/e;->a(LC2/d;LE2/c$a;Landroid/os/Handler;)LE2/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public b()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Lcom/android/systemui/unfold/progress/i;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LC2/a$b;->k:Lf4/f;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Optional;

    .line 8
    .line 9
    return-object p0
.end method
