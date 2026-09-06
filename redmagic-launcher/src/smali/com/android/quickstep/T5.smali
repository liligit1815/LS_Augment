.class public final synthetic Lcom/android/quickstep/T5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TopTaskTracker;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TopTaskTracker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/T5;->a:Lcom/android/quickstep/TopTaskTracker;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/T5;->a:Lcom/android/quickstep/TopTaskTracker;

    .line 2
    .line 3
    check-cast p1, Landroid/app/TaskInfo;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/TopTaskTracker;->z2(Lcom/android/quickstep/TopTaskTracker;Landroid/app/TaskInfo;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
