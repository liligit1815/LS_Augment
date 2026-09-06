.class public final synthetic Lcom/android/quickstep/h7;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/h7;->a:I

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/h7;->b:I

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/quickstep/h7;->c:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/h7;->a:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/h7;->b:I

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/h7;->c:Z

    .line 6
    .line 7
    check-cast p1, Lcom/android/launcher3/taskbar/g3;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->O2(IIZLcom/android/launcher3/taskbar/g3;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
