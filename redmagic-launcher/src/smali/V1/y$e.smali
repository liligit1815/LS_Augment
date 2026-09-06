.class final LV1/y$e;
.super Ljava/lang/Object;
.source "BubbleBarViewAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LV1/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "e"
.end annotation


# instance fields
.field private a:F

.field private b:Z

.field private c:Z

.field final synthetic d:LV1/y;


# direct methods
.method public constructor <init>(LV1/y;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LV1/y$e;->d:LV1/y;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, LV1/y$e;->a:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(F)V
    .locals 3

    .line 1
    iget-boolean v0, p0, LV1/y$e;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget v0, p0, LV1/y$e;->a:F

    .line 7
    .line 8
    cmpl-float v0, p1, v0

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, LV1/y$e;->c:Z

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, LV1/y$e;->d:LV1/y;

    .line 15
    .line 16
    invoke-static {v0}, LV1/y;->x(LV1/y;)LV1/y$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, LV1/y$a;->d()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    :goto_0
    iget-boolean v2, p0, LV1/y$e;->c:Z

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-boolean v0, p0, LV1/y$e;->b:Z

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, LV1/y$e;->d:LV1/y;

    .line 39
    .line 40
    invoke-static {v0}, LV1/y;->w(LV1/y;)V

    .line 41
    .line 42
    .line 43
    iput-boolean v1, p0, LV1/y$e;->b:Z

    .line 44
    .line 45
    :cond_2
    iput p1, p0, LV1/y$e;->a:F

    .line 46
    .line 47
    return-void
.end method
