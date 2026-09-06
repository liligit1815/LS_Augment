.class public final synthetic Lcom/android/quickstep/Y5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:[Landroid/app/TaskInfo;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(I[Landroid/app/TaskInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/Y5;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/Y5;->b:[Landroid/app/TaskInfo;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/Y5;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/Y5;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/Y5;->b:[Landroid/app/TaskInfo;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/Y5;->c:I

    .line 6
    .line 7
    check-cast p1, Landroid/app/TaskInfo;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->b(I[Landroid/app/TaskInfo;ILandroid/app/TaskInfo;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
