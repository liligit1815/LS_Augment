.class final Lo0/i$c;
.super Ljava/lang/Object;
.source "EmbeddingAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lo0/i;


# direct methods
.method public constructor <init>(Lo0/i;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lo0/i$c;->a:Lo0/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroidx/window/extensions/embedding/SplitInfo;)Lo0/D;
    .locals 5

    .line 1
    const-string v0, "splitInfo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lo0/D;

    .line 7
    .line 8
    iget-object v1, p0, Lo0/i$c;->a:Lo0/i;

    .line 9
    .line 10
    invoke-static {v1}, Lo0/i;->a(Lo0/i;)Lo0/i$b;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getPrimaryActivityStack()Landroidx/window/extensions/embedding/ActivityStack;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string v3, "splitInfo.primaryActivityStack"

    .line 19
    .line 20
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lo0/i$b;->i(Landroidx/window/extensions/embedding/ActivityStack;)Lo0/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v2, p0, Lo0/i$c;->a:Lo0/i;

    .line 28
    .line 29
    invoke-static {v2}, Lo0/i;->a(Lo0/i;)Lo0/i$b;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getSecondaryActivityStack()Landroidx/window/extensions/embedding/ActivityStack;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v4, "splitInfo.secondaryActivityStack"

    .line 38
    .line 39
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Lo0/i$b;->i(Landroidx/window/extensions/embedding/ActivityStack;)Lo0/c;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object p0, p0, Lo0/i$c;->a:Lo0/i;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitInfo;->getSplitAttributes()Landroidx/window/extensions/embedding/SplitAttributes;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v3, "splitInfo.splitAttributes"

    .line 53
    .line 54
    invoke-static {p1, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lo0/i;->i(Landroidx/window/extensions/embedding/SplitAttributes;)Lo0/B;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget-object p1, Lo0/i;->d:Lo0/i$a;

    .line 62
    .line 63
    invoke-virtual {p1}, Lo0/i$a;->b()Landroid/os/Binder;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {v0, v1, v2, p0, p1}, Lo0/D;-><init>(Lo0/c;Lo0/c;Lo0/B;Landroid/os/IBinder;)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method
