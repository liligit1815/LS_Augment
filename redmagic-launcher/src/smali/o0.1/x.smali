.class public Lo0/x;
.super Ljava/lang/Object;
.source "OverlayControllerImpl.kt"


# instance fields
.field private final a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

.field private final b:Lo0/i;

.field private final c:Ljava/util/concurrent/locks/ReentrantLock;

.field private final d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final f:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroidx/window/extensions/embedding/ActivityStack;",
            ">;"
        }
    .end annotation
.end field

.field private final g:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "LI/a<",
            "Ljava/lang/Object;",
            ">;",
            "Landroidx/window/extensions/core/util/function/Consumer<",
            "Ljava/util/List<",
            "Landroidx/window/extensions/embedding/ActivityStack;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Lo0/i;)V
    .locals 1

    .line 1
    const-string v0, "embeddingExtension"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "adapter"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lo0/x;->a:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 15
    .line 16
    iput-object p2, p0, Lo0/x;->b:Lo0/i;

    .line 17
    .line 18
    new-instance p2, Ljava/util/concurrent/locks/ReentrantLock;

    .line 19
    .line 20
    invoke-direct {p2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lo0/x;->c:Ljava/util/concurrent/locks/ReentrantLock;

    .line 24
    .line 25
    new-instance p2, Landroid/util/ArrayMap;

    .line 26
    .line 27
    invoke-direct {p2}, Landroid/util/ArrayMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lo0/x;->d:Ljava/util/Map;

    .line 31
    .line 32
    new-instance p2, Landroid/util/ArrayMap;

    .line 33
    .line 34
    invoke-direct {p2}, Landroid/util/ArrayMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p2, p0, Lo0/x;->e:Landroid/util/ArrayMap;

    .line 38
    .line 39
    new-instance p2, Landroid/util/ArrayMap;

    .line 40
    .line 41
    invoke-direct {p2}, Landroid/util/ArrayMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Lo0/x;->f:Landroid/util/ArrayMap;

    .line 45
    .line 46
    new-instance p2, Landroid/util/ArrayMap;

    .line 47
    .line 48
    invoke-direct {p2}, Landroid/util/ArrayMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lo0/x;->g:Landroid/util/ArrayMap;

    .line 52
    .line 53
    sget-object p2, Lm0/d;->b:Lm0/d$a;

    .line 54
    .line 55
    invoke-virtual {p2}, Lm0/d$a;->a()Lm0/d;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const/4 v0, 0x5

    .line 60
    invoke-virtual {p2, v0}, Lm0/d;->c(I)V

    .line 61
    .line 62
    .line 63
    new-instance p2, Lo0/v;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Lo0/v;-><init>(Lo0/x;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {p1, p2}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setActivityStackAttributesCalculator(Landroidx/window/extensions/core/util/function/Function;)V

    .line 69
    .line 70
    .line 71
    new-instance p2, Lc0/b;

    .line 72
    .line 73
    invoke-direct {p2}, Lc0/b;-><init>()V

    .line 74
    .line 75
    .line 76
    new-instance v0, Lo0/w;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Lo0/w;-><init>(Lo0/x;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {p1, p2, v0}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->registerActivityStackCallback(Ljava/util/concurrent/Executor;Landroidx/window/extensions/core/util/function/Consumer;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
