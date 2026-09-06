.class public final Lcom/android/quickstep/FocusState$init$1;
.super Lcom/android/wm/shell/shared/j$a;
.source "FocusState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/FocusState;->init(Lcom/android/wm/shell/shared/l;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/FocusState;


# direct methods
.method constructor <init>(Lcom/android/quickstep/FocusState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/FocusState$init$1;->this$0:Lcom/android/quickstep/FocusState;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/wm/shell/shared/j$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/FocusState;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/FocusState$init$1;->onFocusedDisplayChanged$lambda$0(Lcom/android/quickstep/FocusState;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onFocusedDisplayChanged$lambda$0(Lcom/android/quickstep/FocusState;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/FocusState;->access$setFocusedDisplayId(Lcom/android/quickstep/FocusState;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onFocusedDisplayChanged(I)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/FocusState$init$1;->this$0:Lcom/android/quickstep/FocusState;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/b1;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/b1;-><init>(Lcom/android/quickstep/FocusState;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
