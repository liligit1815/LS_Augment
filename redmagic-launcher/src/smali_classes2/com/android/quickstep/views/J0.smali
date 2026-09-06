.class public final synthetic Lcom/android/quickstep/views/J0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic b:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/J0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/J0;->b:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/J0;->a:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/J0;->b:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/RecentsView;->V0(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
