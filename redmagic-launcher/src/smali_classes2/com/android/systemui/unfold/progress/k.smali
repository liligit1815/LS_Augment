.class public final Lcom/android/systemui/unfold/progress/k;
.super Ljava/lang/Object;
.source "RemoteUnfoldTransitionReceiver_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/systemui/unfold/progress/i;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lf4/f;Lf4/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/unfold/progress/k;->a:Lf4/f;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/unfold/progress/k;->b:Lf4/f;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lf4/f;Lf4/f;)Lcom/android/systemui/unfold/progress/k;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lf4/f<",
            "Ljava/util/concurrent/Executor;",
            ">;)",
            "Lcom/android/systemui/unfold/progress/k;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/systemui/unfold/progress/k;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/systemui/unfold/progress/k;-><init>(Lf4/f;Lf4/f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(ZLjava/util/concurrent/Executor;)Lcom/android/systemui/unfold/progress/i;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/systemui/unfold/progress/i;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/systemui/unfold/progress/i;-><init>(ZLjava/util/concurrent/Executor;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lcom/android/systemui/unfold/progress/i;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/unfold/progress/k;->a:Lf4/f;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Lcom/android/systemui/unfold/progress/k;->b:Lf4/f;

    .line 14
    .line 15
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/concurrent/Executor;

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/android/systemui/unfold/progress/k;->c(ZLjava/util/concurrent/Executor;)Lcom/android/systemui/unfold/progress/i;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/systemui/unfold/progress/k;->b()Lcom/android/systemui/unfold/progress/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
