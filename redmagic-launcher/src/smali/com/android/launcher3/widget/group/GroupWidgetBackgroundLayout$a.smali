.class Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;
.super Ljava/lang/Object;
.source "GroupWidgetBackgroundLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:J

.field final synthetic i:Z

.field final synthetic j:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;ZJZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->j:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->g:Z

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->h:J

    .line 6
    .line 7
    iput-boolean p5, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->i:Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "doBgScaleAnim on delay toBig="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->g:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " do="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->j:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->a(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->h:J

    .line 28
    .line 29
    cmp-long v1, v1, v3

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v1, 0x0

    .line 36
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, " mAnimKeyTime="

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->j:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->a(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, " animKeyTime="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->h:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "GroupWidgetBackgroundLayout"

    .line 68
    .line 69
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->j:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->a(Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;)J

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    iget-wide v2, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->h:J

    .line 79
    .line 80
    cmp-long v0, v0, v2

    .line 81
    .line 82
    if-nez v0, :cond_1

    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->j:Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->g:Z

    .line 87
    .line 88
    iget-boolean p0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout$a;->i:Z

    .line 89
    .line 90
    const-wide/16 v2, 0x0

    .line 91
    .line 92
    invoke-virtual {v0, v1, p0, v2, v3}, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;->d(ZZJ)V

    .line 93
    .line 94
    .line 95
    :cond_1
    return-void
.end method
