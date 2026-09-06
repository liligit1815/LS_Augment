.class public final synthetic Lcom/android/quickstep/views/h1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/V4$c;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/h1;->a:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/h1;->a:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/views/RecentsView;->Y0(Lcom/android/quickstep/views/TaskView;Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
