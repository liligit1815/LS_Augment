.class public final synthetic Lcom/android/quickstep/j3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/p2$a;


# instance fields
.field public final synthetic g:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/j3;->g:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onSettingsChanged(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/j3;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->K(Landroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
