.class public final synthetic Lcom/android/quickstep/J;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/AbsSwipeUpHandler;

.field public final synthetic h:Ljava/util/function/Consumer;

.field public final synthetic i:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/util/function/Consumer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/J;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/J;->h:Ljava/util/function/Consumer;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/J;->i:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/J;->g:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/J;->h:Ljava/util/function/Consumer;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/J;->i:Z

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->G(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/util/function/Consumer;ZLjava/lang/Boolean;)Lh4/t;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
