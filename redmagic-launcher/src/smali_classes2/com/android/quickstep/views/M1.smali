.class public final synthetic Lcom/android/quickstep/views/M1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/TaskMenuView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/M1;->a:Lcom/android/quickstep/views/TaskMenuView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/M1;->a:Lcom/android/quickstep/views/TaskMenuView;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/popup/P;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/views/TaskMenuView;->V(Lcom/android/quickstep/views/TaskMenuView;Lcom/android/launcher3/popup/P;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
