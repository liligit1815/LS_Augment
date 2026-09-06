.class public final synthetic Lcom/android/quickstep/I;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntPredicate;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/AbsSwipeUpHandler;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/I;->a:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/I;->a:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->t(Lcom/android/quickstep/AbsSwipeUpHandler;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
