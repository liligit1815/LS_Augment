.class public final synthetic Lcom/android/quickstep/W5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Landroid/app/TaskInfo;


# direct methods
.method public synthetic constructor <init>(Landroid/app/TaskInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/W5;->a:Landroid/app/TaskInfo;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/W5;->a:Landroid/app/TaskInfo;

    .line 2
    .line 3
    check-cast p1, Landroid/app/TaskInfo;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->A2(Landroid/app/TaskInfo;Landroid/app/TaskInfo;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
