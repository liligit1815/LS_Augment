.class final synthetic Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;
.super Lkotlin/jvm/internal/r;
.source "TaskView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/TaskView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;->INSTANCE:Lcom/android/quickstep/views/TaskView$Companion$DISMISS_SCALE$1;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "getDismissScale()F"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-class v2, Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    const-string v3, "dismissScale"

    .line 7
    .line 8
    invoke-direct {p0, v2, v3, v0, v1}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/views/TaskView;->access$getDismissScale$p(Lcom/android/quickstep/views/TaskView;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Number;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p1, p0}, Lcom/android/quickstep/views/TaskView;->access$setDismissScale(Lcom/android/quickstep/views/TaskView;F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
