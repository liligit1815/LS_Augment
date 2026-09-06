.class public final synthetic Lcom/android/quickstep/m3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/p2;

.field public final synthetic h:Lcom/android/launcher3/util/p2$a;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/m3;->g:Lcom/android/launcher3/util/p2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/m3;->h:Lcom/android/launcher3/util/p2$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/m3;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/m3;->h:Lcom/android/launcher3/util/p2$a;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->y(Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
