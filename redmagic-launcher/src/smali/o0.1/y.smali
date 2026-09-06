.class public final Lo0/y;
.super Ljava/lang/Object;
.source "RuleController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/y$a;
    }
.end annotation


# static fields
.field public static final b:Lo0/y$a;


# instance fields
.field private final a:Lo0/l;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/y$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/y$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/y;->b:Lo0/y$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lo0/l;)V
    .locals 1

    .line 1
    const-string v0, "embeddingBackend"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lo0/y;->a:Lo0/l;

    .line 10
    .line 11
    return-void
.end method

.method public static final a(Landroid/content/Context;)Lo0/y;
    .locals 1

    .line 1
    sget-object v0, Lo0/y;->b:Lo0/y$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lo0/y$a;->a(Landroid/content/Context;)Lo0/y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static final b(Landroid/content/Context;I)Ljava/util/Set;
    .locals 1
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
    sget-object v0, Lo0/y;->b:Lo0/y$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1}, Lo0/y$a;->b(Landroid/content/Context;I)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public final c(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lo0/r;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "rules"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lo0/y;->a:Lo0/l;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lo0/l;->a(Ljava/util/Set;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
