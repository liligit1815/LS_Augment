.class public final synthetic Lcom/android/quickstep/V3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/util/p2;

.field public final synthetic h:Landroid/net/Uri;

.field public final synthetic i:Lcom/android/launcher3/util/p2$a;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/V3;->g:Lcom/android/launcher3/util/p2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/V3;->h:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/V3;->i:Lcom/android/launcher3/util/p2$a;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/V3;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/V3;->h:Landroid/net/Uri;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/V3;->i:Lcom/android/launcher3/util/p2$a;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->n(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
