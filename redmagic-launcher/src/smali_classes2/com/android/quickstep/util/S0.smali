.class public final synthetic Lcom/android/quickstep/util/S0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/SplitSelectStateController;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/function/Consumer;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController;Ljava/util/List;Ljava/util/function/Consumer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/S0;->a:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/S0;->b:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/S0;->c:Ljava/util/function/Consumer;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/quickstep/util/S0;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/S0;->a:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/S0;->b:Ljava/util/List;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/S0;->c:Ljava/util/function/Consumer;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/quickstep/util/S0;->d:Z

    .line 8
    .line 9
    check-cast p1, Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/quickstep/util/SplitSelectStateController;->a(Lcom/android/quickstep/util/SplitSelectStateController;Ljava/util/List;Ljava/util/function/Consumer;ZLjava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
