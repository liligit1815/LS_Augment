.class Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;
.super Ljava/lang/Object;
.source "ConcernStandardFeatureModeActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;


# direct methods
.method constructor <init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;->g:Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;->g:Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->u0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;ZZZZZ)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;->g:Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->r0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;->g:Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-static {p0, p1, p2, p2}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;->t0(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity;ZZZ)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b$a;

    .line 34
    .line 35
    invoke-direct {p2, p0}, Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b$a;-><init>(Lcom/android/launcher3/settings/ConcernStandardFeatureModeActivity$b;)V

    .line 36
    .line 37
    .line 38
    const-wide/16 v0, 0x64

    .line 39
    .line 40
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method
