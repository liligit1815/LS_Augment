.class public final synthetic Lcom/android/quickstep/L5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TopTaskTracker;

.field public final synthetic b:Lx1/r;

.field public final synthetic c:Lcom/android/launcher3/C2;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TopTaskTracker;Lx1/r;Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/L5;->a:Lcom/android/quickstep/TopTaskTracker;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/L5;->b:Lx1/r;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/L5;->c:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/L5;->a:Lcom/android/quickstep/TopTaskTracker;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/L5;->b:Lx1/r;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/L5;->c:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TopTaskTracker;->E2(Lcom/android/quickstep/TopTaskTracker;Lx1/r;Lcom/android/launcher3/C2;Ljava/lang/Boolean;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
