.class Lz1/w4$a;
.super Ljava/lang/Object;
.source "QuickstepModelDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/w4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:Lcom/android/launcher3/util/R1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/R1<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/app/prediction/AppPredictor;

.field public d:Lt1/g;

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ILjava/lang/String;Lt1/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lz1/w4$a;->a:I

    .line 5
    .line 6
    new-instance p1, Lcom/android/launcher3/util/R1;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Lcom/android/launcher3/util/R1;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lz1/w4$a;->b:Lcom/android/launcher3/util/R1;

    .line 12
    .line 13
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 14
    .line 15
    iput-object p1, p0, Lz1/w4$a;->e:Ljava/util/List;

    .line 16
    .line 17
    iput-object p3, p0, Lz1/w4$a;->d:Lt1/g;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Ljava/util/List;I)Z
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/app/prediction/AppTarget;

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/app/prediction/AppTarget;

    .line 12
    .line 13
    invoke-static {p0, p1}, Lz1/w4;->p(Landroid/app/prediction/AppTarget;Landroid/app/prediction/AppTarget;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/prediction/AppPredictor;->destroy()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lz1/w4$a;->c:Landroid/app/prediction/AppPredictor;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method c(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/app/prediction/AppTarget;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lz1/w4$a;->e:Ljava/util/List;

    .line 2
    .line 3
    iput-object p1, p0, Lz1/w4$a;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne p0, v1, :cond_0

    .line 15
    .line 16
    invoke-static {v2, p0}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v1, Lz1/v4;

    .line 21
    .line 22
    invoke-direct {v1, v0, p1}, Lz1/v4;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/stream/IntStream;->allMatch(Ljava/util/function/IntPredicate;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    return v2
.end method
