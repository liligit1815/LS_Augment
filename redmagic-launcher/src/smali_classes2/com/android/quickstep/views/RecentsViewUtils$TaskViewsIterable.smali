.class public final Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;
.super Ljava/lang/Object;
.source "RecentsViewUtils.kt"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lv4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/RecentsViewUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TaskViewsIterable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/android/quickstep/views/TaskView;",
        ">;",
        "Lv4/a;"
    }
.end annotation


# instance fields
.field private final recentsView:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "recentsView"

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
    iput-object p1, p0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e(Landroid/view/View;)Lcom/android/quickstep/views/TaskView;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->iterator$lambda$2(Landroid/view/View;)Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final iterator$lambda$2(Landroid/view/View;)Lcom/android/quickstep/views/TaskView;
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p0, Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method


# virtual methods
.method public final forEachWithIndexInParent(Ljava/util/function/BiConsumer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/BiConsumer<",
            "Ljava/lang/Integer;",
            "Lcom/android/quickstep/views/TaskView;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "consumer"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    invoke-static {p0}, LJ/N;->a(Landroid/view/ViewGroup;)LC4/e;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, LC4/e;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    add-int/lit8 v2, v0, 0x1

    .line 28
    .line 29
    if-gez v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Li4/m;->r()V

    .line 32
    .line 33
    .line 34
    :cond_0
    check-cast v1, Landroid/view/View;

    .line 35
    .line 36
    instance-of v3, v1, Lcom/android/quickstep/views/TaskView;

    .line 37
    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    check-cast v1, Lcom/android/quickstep/views/TaskView;

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const/4 v1, 0x0

    .line 44
    :goto_1
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {p1, v0, v1}, Ljava/util/function/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    move v0, v2

    .line 54
    goto :goto_0

    .line 55
    :cond_3
    return-void
.end method

.method public final getRecentsView()Lcom/android/quickstep/views/RecentsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/android/quickstep/views/TaskView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsViewUtils$TaskViewsIterable;->recentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {p0}, LJ/N;->a(Landroid/view/ViewGroup;)LC4/e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/android/quickstep/views/I1;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/android/quickstep/views/I1;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, LC4/h;->m(LC4/e;Lu4/l;)LC4/e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, LC4/e;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
