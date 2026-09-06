.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;
.super Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;
.source "AIFutureWidgetDigitalHumanLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onHumanInited()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "mCallback onHumanInited"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onMotionStart(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "mCallback onMotionStart motionVia="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " s="

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onMotionStop(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "mCallback onMotionStop motionVia="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onSpeakStart(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "mCallback onSpeakStart via="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " words="

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onSpeakStop(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;->g:Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "mCallback onSpeakStop via="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method
