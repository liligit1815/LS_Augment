.class public final Lcom/android/quickstep/views/GroupedTaskView;
.super Lcom/android/quickstep/views/TaskView;
.source "GroupedTaskView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/GroupedTaskView$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/GroupedTaskView$Companion;

.field private static final TAG:Ljava/lang/String; = "GroupedTaskView"


# instance fields
.field private final MINIMUM_RATIO_TO_SHOW_ICON:F

.field private iconDrawable2:Landroid/graphics/drawable/Drawable;

.field private isSecondSplitActivity:Z

.field private splitBoundsConfig:Lcom/android/launcher3/util/y2$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/GroupedTaskView$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/GroupedTaskView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/GroupedTaskView;->Companion:Lcom/android/quickstep/views/GroupedTaskView$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/GroupedTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    sget-object v8, Lcom/android/quickstep/views/TaskViewType;->GROUPED:Lcom/android/quickstep/views/TaskViewType;

    const/16 v10, 0xbc

    const/4 v11, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v11}, Lcom/android/quickstep/views/TaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/util/BorderAnimator;Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/FullscreenDrawParams;ILkotlin/jvm/internal/j;)V

    const p0, 0x3e4ccccd    # 0.2f

    .line 4
    iput p0, v1, Lcom/android/quickstep/views/GroupedTaskView;->MINIMUM_RATIO_TO_SHOW_ICON:F

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/GroupedTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic D(Lcom/android/launcher3/util/Y1;Z)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/GroupedTaskView;->launchAsStaticTile$lambda$5(Lcom/android/launcher3/util/Y1;Z)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E(Lu4/l;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/GroupedTaskView;->launchTaskInternal$lambda$7$lambda$6(Lu4/l;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final containsPoint(Landroid/view/View;Landroid/graphics/PointF;)Z
    .locals 3

    .line 1
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput v0, v1, v2

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput p2, v1, v0

    .line 13
    .line 14
    invoke-static {p1, p0, v1}, Lcom/android/launcher3/N5;->K(Landroid/view/View;Landroid/view/View;[F)V

    .line 15
    .line 16
    .line 17
    aget p0, v1, v2

    .line 18
    .line 19
    aget p2, v1, v0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {p1, p0, p2, v0}, Lcom/android/launcher3/N5;->Q(Landroid/view/View;FFF)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method private final getThisTaskCurrentlyInSplitSelection()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getInitialTaskId()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/TaskView;->containsTaskId(I)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, -0x1

    .line 41
    return p0
.end method

.method private static final launchAsStaticTile$lambda$5(Lcom/android/launcher3/util/Y1;Z)Lh4/t;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 2
    .line 3
    .line 4
    const/16 p0, 0x31

    .line 5
    .line 6
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 10
    .line 11
    return-object p0
.end method

.method private final launchTaskInternal(ZZLu4/l;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    move-object v2, p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    move-object v2, v0

    .line 17
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getLeftTopTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 26
    .line 27
    iget v3, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 38
    .line 39
    iget v4, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 40
    .line 41
    new-instance v6, Lcom/android/quickstep/views/o;

    .line 42
    .line 43
    invoke-direct {v6, p3}, Lcom/android/quickstep/views/o;-><init>(Lu4/l;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getSnapPosition()I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    const/4 v5, 0x0

    .line 51
    move v7, p1

    .line 52
    invoke-virtual/range {v1 .. v8}, Lcom/android/quickstep/util/SplitSelectStateController;->launchExistingSplitPair(Lcom/android/quickstep/views/GroupedTaskView;IIILjava/util/function/Consumer;ZI)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "toString(...)"

    .line 64
    .line 65
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    new-instance p1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string p3, "launchTaskInternal - launchExistingSplitPair: "

    .line 74
    .line 75
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p0, ", launchingExistingTaskView: "

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p1, "GroupedTaskView"

    .line 94
    .line 95
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method private static final launchTaskInternal$lambda$7$lambda$6(Lu4/l;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final updateIconPlacement()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getMSplitScreenGroupShortcutsItem()Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 21
    .line 22
    const/4 v4, 0x4

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-interface {v1, v4}, Lcom/android/quickstep/views/TaskViewIcon;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getMMenuButton()Landroid/widget/ImageView;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_1b

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getMMenuButton()Landroid/widget/ImageView;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-eqz v0, :cond_1b

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    iget-object v1, v0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 72
    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    goto/16 :goto_a

    .line 76
    .line 77
    :cond_3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    const-string v5, "getDeviceProfile(...)"

    .line 93
    .line 94
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v4}, Lcom/android/quickstep/views/TaskView;->getIconSize(Lcom/android/launcher3/h0;)F

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-direct {v0}, Lcom/android/quickstep/views/GroupedTaskView;->getThisTaskCurrentlyInSplitSelection()I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    const/4 v7, -0x1

    .line 106
    const/4 v8, 0x0

    .line 107
    if-eq v6, v7, :cond_4

    .line 108
    .line 109
    move v6, v3

    .line 110
    goto :goto_0

    .line 111
    :cond_4
    move v6, v8

    .line 112
    :goto_0
    invoke-static {}, LH2/c;->i()Z

    .line 113
    .line 114
    .line 115
    move-result v7

    .line 116
    const/4 v9, 0x0

    .line 117
    if-eqz v7, :cond_b

    .line 118
    .line 119
    if-eqz v6, :cond_7

    .line 120
    .line 121
    invoke-direct {v0}, Lcom/android/quickstep/views/GroupedTaskView;->getThisTaskCurrentlyInSplitSelection()I

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    iget v7, v1, Lcom/android/launcher3/util/y2$a;->k:I

    .line 126
    .line 127
    if-ne v6, v7, :cond_5

    .line 128
    .line 129
    move v6, v3

    .line 130
    goto :goto_1

    .line 131
    :cond_5
    move v6, v8

    .line 132
    :goto_1
    invoke-direct {v0}, Lcom/android/quickstep/views/GroupedTaskView;->getThisTaskCurrentlyInSplitSelection()I

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    iget v1, v1, Lcom/android/launcher3/util/y2$a;->l:I

    .line 137
    .line 138
    if-ne v7, v1, :cond_6

    .line 139
    .line 140
    :goto_2
    move v1, v3

    .line 141
    goto :goto_4

    .line 142
    :cond_6
    move v1, v8

    .line 143
    goto :goto_4

    .line 144
    :cond_7
    invoke-virtual {v1}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    iget v7, v0, Lcom/android/quickstep/views/GroupedTaskView;->MINIMUM_RATIO_TO_SHOW_ICON:F

    .line 149
    .line 150
    cmpg-float v6, v6, v7

    .line 151
    .line 152
    if-gez v6, :cond_8

    .line 153
    .line 154
    move v6, v3

    .line 155
    goto :goto_3

    .line 156
    :cond_8
    move v6, v8

    .line 157
    :goto_3
    invoke-virtual {v1}, Lcom/android/launcher3/util/y2$a;->c()F

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    iget v7, v0, Lcom/android/quickstep/views/GroupedTaskView;->MINIMUM_RATIO_TO_SHOW_ICON:F

    .line 162
    .line 163
    cmpg-float v1, v1, v7

    .line 164
    .line 165
    if-gez v1, :cond_6

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :goto_4
    invoke-virtual {v0}, Lcom/android/quickstep/views/GroupedTaskView;->getLeftTopTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    const/high16 v10, 0x3f800000    # 1.0f

    .line 177
    .line 178
    if-eqz v6, :cond_9

    .line 179
    .line 180
    move v6, v9

    .line 181
    goto :goto_5

    .line 182
    :cond_9
    move v6, v10

    .line 183
    :goto_5
    invoke-interface {v7, v6}, Lcom/android/quickstep/views/TaskViewIcon;->setFlexSplitAlpha(F)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/android/quickstep/views/GroupedTaskView;->getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    if-eqz v1, :cond_a

    .line 195
    .line 196
    move v10, v9

    .line 197
    :cond_a
    invoke-interface {v6, v10}, Lcom/android/quickstep/views/TaskViewIcon;->setFlexSplitAlpha(F)V

    .line 198
    .line 199
    .line 200
    :cond_b
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 209
    .line 210
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-interface {v1}, Lcom/android/quickstep/views/TaskViewIcon;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    const-string v6, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 219
    .line 220
    invoke-static {v1, v6}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    move-object v14, v1

    .line 224
    check-cast v14, Landroid/widget/FrameLayout$LayoutParams;

    .line 225
    .line 226
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 227
    .line 228
    invoke-direct {v1, v14}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 240
    .line 241
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 242
    .line 243
    .line 244
    move-result-object v7

    .line 245
    invoke-interface {v7}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object v7

    .line 249
    invoke-virtual {v7, v9}, Landroid/view/View;->setTranslationX(F)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v7

    .line 260
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 261
    .line 262
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    invoke-interface {v7}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object v7

    .line 270
    invoke-virtual {v7, v9}, Landroid/view/View;->setTranslationY(F)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 274
    .line 275
    .line 276
    move-result-object v7

    .line 277
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v7

    .line 281
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 282
    .line 283
    const/4 v10, 0x0

    .line 284
    if-eqz v7, :cond_c

    .line 285
    .line 286
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 287
    .line 288
    .line 289
    move-result-object v7

    .line 290
    goto :goto_6

    .line 291
    :cond_c
    move-object v7, v10

    .line 292
    :goto_6
    if-eqz v7, :cond_1c

    .line 293
    .line 294
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 295
    .line 296
    .line 297
    move-result-object v7

    .line 298
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v7

    .line 302
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 303
    .line 304
    if-eqz v7, :cond_d

    .line 305
    .line 306
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 307
    .line 308
    .line 309
    move-result-object v7

    .line 310
    goto :goto_7

    .line 311
    :cond_d
    move-object v7, v10

    .line 312
    :goto_7
    if-nez v7, :cond_e

    .line 313
    .line 314
    goto/16 :goto_b

    .line 315
    .line 316
    :cond_e
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 317
    .line 318
    .line 319
    move-result-object v7

    .line 320
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v7

    .line 324
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 325
    .line 326
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 327
    .line 328
    .line 329
    move-result-object v7

    .line 330
    if-eqz v7, :cond_f

    .line 331
    .line 332
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 333
    .line 334
    .line 335
    :cond_f
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 336
    .line 337
    .line 338
    move-result-object v7

    .line 339
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v7

    .line 343
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 344
    .line 345
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 346
    .line 347
    .line 348
    move-result-object v7

    .line 349
    if-eqz v7, :cond_10

    .line 350
    .line 351
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 352
    .line 353
    .line 354
    :cond_10
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 355
    .line 356
    .line 357
    move-result-object v7

    .line 358
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v7

    .line 362
    check-cast v7, Lcom/android/quickstep/views/TaskContainer;

    .line 363
    .line 364
    if-eqz v7, :cond_11

    .line 365
    .line 366
    invoke-virtual {v7}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 367
    .line 368
    .line 369
    move-result-object v10

    .line 370
    :cond_11
    invoke-static {v10}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {v10}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 374
    .line 375
    .line 376
    move-result-object v7

    .line 377
    invoke-static {v7, v6}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    check-cast v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 381
    .line 382
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 383
    .line 384
    invoke-direct {v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 388
    .line 389
    .line 390
    move-result-object v9

    .line 391
    invoke-interface {v9}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 392
    .line 393
    .line 394
    move-result-object v9

    .line 395
    invoke-static {v9, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTextPaddingLeft()F

    .line 399
    .line 400
    .line 401
    move-result v5

    .line 402
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 403
    .line 404
    .line 405
    move-result v5

    .line 406
    invoke-virtual {v0, v9, v5}, Lcom/android/quickstep/views/GroupedTaskView;->getTextWidth(Lcom/android/launcher3/h0;I)I

    .line 407
    .line 408
    .line 409
    move-result v5

    .line 410
    iput v5, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 411
    .line 412
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 413
    .line 414
    .line 415
    move-result-object v5

    .line 416
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v5

    .line 420
    check-cast v5, Lcom/android/quickstep/views/TaskContainer;

    .line 421
    .line 422
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 423
    .line 424
    .line 425
    move-result-object v5

    .line 426
    if-eqz v5, :cond_12

    .line 427
    .line 428
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTextSize()F

    .line 429
    .line 430
    .line 431
    move-result v9

    .line 432
    invoke-virtual {v5, v8, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 433
    .line 434
    .line 435
    :cond_12
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 436
    .line 437
    .line 438
    move-result v12

    .line 439
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 440
    .line 441
    .line 442
    move-result-object v4

    .line 443
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v4

    .line 447
    check-cast v4, Lcom/android/quickstep/views/TaskContainer;

    .line 448
    .line 449
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 450
    .line 451
    .line 452
    move-result-object v4

    .line 453
    invoke-interface {v4, v12, v12}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawableSize(II)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->shouldInflateGridStyle()Z

    .line 457
    .line 458
    .line 459
    move-result v4

    .line 460
    if-eqz v4, :cond_13

    .line 461
    .line 462
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 467
    .line 468
    .line 469
    move-result-object v4

    .line 470
    iget v4, v4, Lcom/android/launcher3/X3;->j0:I

    .line 471
    .line 472
    :goto_8
    int-to-float v4, v4

    .line 473
    goto :goto_9

    .line 474
    :cond_13
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 475
    .line 476
    .line 477
    move-result v4

    .line 478
    if-eqz v4, :cond_14

    .line 479
    .line 480
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 481
    .line 482
    .line 483
    move-result-object v4

    .line 484
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 485
    .line 486
    .line 487
    move-result-object v4

    .line 488
    iget v4, v4, Lcom/android/launcher3/X3;->i0:I

    .line 489
    .line 490
    goto :goto_8

    .line 491
    :cond_14
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 492
    .line 493
    .line 494
    move-result-object v4

    .line 495
    invoke-interface {v4}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 496
    .line 497
    .line 498
    move-result-object v4

    .line 499
    iget v4, v4, Lcom/android/launcher3/X3;->j0:I

    .line 500
    .line 501
    int-to-float v4, v4

    .line 502
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getGridToSingleScale()F

    .line 503
    .line 504
    .line 505
    move-result v5

    .line 506
    mul-float/2addr v4, v5

    .line 507
    :goto_9
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 508
    .line 509
    .line 510
    move-result-object v5

    .line 511
    invoke-interface {v5}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 512
    .line 513
    .line 514
    move-result-object v5

    .line 515
    iget-boolean v5, v5, Lcom/android/launcher3/h0;->G0:Z

    .line 516
    .line 517
    if-eqz v5, :cond_17

    .line 518
    .line 519
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    .line 520
    .line 521
    .line 522
    move-result v5

    .line 523
    if-eqz v5, :cond_15

    .line 524
    .line 525
    const/4 v5, 0x2

    .line 526
    int-to-float v5, v5

    .line 527
    mul-float/2addr v4, v5

    .line 528
    :cond_15
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 529
    .line 530
    .line 531
    move-result-object v5

    .line 532
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 533
    .line 534
    .line 535
    move-result-object v9

    .line 536
    const v10, 0x7f0703f5

    .line 537
    .line 538
    .line 539
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 540
    .line 541
    .line 542
    move-result v9

    .line 543
    invoke-static {v5, v9}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 544
    .line 545
    .line 546
    move-result v5

    .line 547
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 548
    .line 549
    .line 550
    move-result-object v9

    .line 551
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 552
    .line 553
    .line 554
    move-result-object v10

    .line 555
    const v11, 0x7f0703f0

    .line 556
    .line 557
    .line 558
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 559
    .line 560
    .line 561
    move-result v10

    .line 562
    invoke-static {v9, v10}, Lx1/O;->A0(Landroid/content/Context;I)I

    .line 563
    .line 564
    .line 565
    move-result v9

    .line 566
    iget v10, v7, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 567
    .line 568
    iput v10, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 569
    .line 570
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 571
    .line 572
    .line 573
    move-result-object v10

    .line 574
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 575
    .line 576
    .line 577
    move-result-object v10

    .line 578
    check-cast v10, Lcom/android/quickstep/views/TaskContainer;

    .line 579
    .line 580
    invoke-virtual {v10}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 581
    .line 582
    .line 583
    move-result-object v10

    .line 584
    if-eqz v10, :cond_16

    .line 585
    .line 586
    int-to-float v5, v5

    .line 587
    invoke-virtual {v10, v8, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 588
    .line 589
    .line 590
    :cond_16
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 591
    .line 592
    .line 593
    move-result-object v5

    .line 594
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 595
    .line 596
    .line 597
    move-result-object v5

    .line 598
    check-cast v5, Lcom/android/quickstep/views/TaskContainer;

    .line 599
    .line 600
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 601
    .line 602
    .line 603
    move-result-object v5

    .line 604
    invoke-interface {v5, v9, v9}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawableSize(II)V

    .line 605
    .line 606
    .line 607
    :cond_17
    move v13, v4

    .line 608
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 609
    .line 610
    .line 611
    move-result-object v10

    .line 612
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 613
    .line 614
    .line 615
    move-result-object v4

    .line 616
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 617
    .line 618
    .line 619
    move-result-object v4

    .line 620
    check-cast v4, Lcom/android/quickstep/views/TaskContainer;

    .line 621
    .line 622
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 623
    .line 624
    .line 625
    move-result-object v11

    .line 626
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 627
    .line 628
    .line 629
    move-result-object v4

    .line 630
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v4

    .line 634
    check-cast v4, Lcom/android/quickstep/views/TaskContainer;

    .line 635
    .line 636
    invoke-virtual {v4}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 637
    .line 638
    .line 639
    move-result-object v15

    .line 640
    move-object/from16 v17, v6

    .line 641
    .line 642
    move-object/from16 v16, v7

    .line 643
    .line 644
    invoke-interface/range {v10 .. v17}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->updateGroupTaskIconAndTaskPosition(Lcom/android/quickstep/views/TaskViewIcon;IFLandroid/widget/FrameLayout$LayoutParams;Landroid/widget/TextView;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout$LayoutParams;)V

    .line 645
    .line 646
    .line 647
    move-object/from16 v4, v17

    .line 648
    .line 649
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 650
    .line 651
    .line 652
    move-result-object v5

    .line 653
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 654
    .line 655
    .line 656
    move-result-object v5

    .line 657
    check-cast v5, Lcom/android/quickstep/views/TaskContainer;

    .line 658
    .line 659
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 660
    .line 661
    .line 662
    move-result-object v5

    .line 663
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 664
    .line 665
    .line 666
    move-result-object v6

    .line 667
    invoke-interface {v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 668
    .line 669
    .line 670
    move-result v6

    .line 671
    invoke-interface {v5, v6}, Lcom/android/quickstep/views/TaskViewIcon;->setRotation(F)V

    .line 672
    .line 673
    .line 674
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 675
    .line 676
    .line 677
    move-result-object v5

    .line 678
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 679
    .line 680
    .line 681
    move-result-object v5

    .line 682
    check-cast v5, Lcom/android/quickstep/views/TaskContainer;

    .line 683
    .line 684
    invoke-virtual {v5}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 685
    .line 686
    .line 687
    move-result-object v5

    .line 688
    invoke-interface {v5, v1}, Lcom/android/quickstep/views/TaskViewIcon;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 689
    .line 690
    .line 691
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 692
    .line 693
    .line 694
    move-result-object v1

    .line 695
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 696
    .line 697
    .line 698
    move-result-object v1

    .line 699
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 700
    .line 701
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 702
    .line 703
    .line 704
    move-result-object v1

    .line 705
    if-eqz v1, :cond_18

    .line 706
    .line 707
    const/16 v5, 0x10

    .line 708
    .line 709
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 710
    .line 711
    .line 712
    :cond_18
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 713
    .line 714
    .line 715
    move-result-object v1

    .line 716
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 717
    .line 718
    .line 719
    move-result-object v1

    .line 720
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 721
    .line 722
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 723
    .line 724
    .line 725
    move-result-object v1

    .line 726
    if-eqz v1, :cond_19

    .line 727
    .line 728
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 729
    .line 730
    .line 731
    move-result-object v5

    .line 732
    invoke-interface {v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 733
    .line 734
    .line 735
    move-result v5

    .line 736
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setRotation(F)V

    .line 737
    .line 738
    .line 739
    :cond_19
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 740
    .line 741
    .line 742
    move-result-object v1

    .line 743
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 744
    .line 745
    .line 746
    move-result-object v1

    .line 747
    check-cast v1, Lcom/android/quickstep/views/TaskContainer;

    .line 748
    .line 749
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 750
    .line 751
    .line 752
    move-result-object v1

    .line 753
    if-eqz v1, :cond_1a

    .line 754
    .line 755
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 756
    .line 757
    .line 758
    :cond_1a
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getMMenuButton()Landroid/widget/ImageView;

    .line 759
    .line 760
    .line 761
    move-result-object v1

    .line 762
    if-eqz v1, :cond_1b

    .line 763
    .line 764
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getMMenuButton()Landroid/widget/ImageView;

    .line 765
    .line 766
    .line 767
    move-result-object v0

    .line 768
    if-eqz v0, :cond_1b

    .line 769
    .line 770
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 771
    .line 772
    .line 773
    :cond_1b
    :goto_a
    return-void

    .line 774
    :cond_1c
    :goto_b
    const-string v0, "GroupedTaskView"

    .line 775
    .line 776
    const-string v1, "updateIconPlacement: textName null return"

    .line 777
    .line 778
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    .line 780
    .line 781
    return-void
.end method

.method private final updateSnapshotBackground()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f060734

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object v1, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->BACKGROUND_PAINT_COLOR:Landroid/util/IntProperty;

    .line 33
    .line 34
    filled-new-array {v0}, [I

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v0, "ofArgb(...)"

    .line 43
    .line 44
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-wide/16 v0, 0x78

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    .line 52
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public final bind(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/util/RecentsOrientedState;Lcom/android/quickstep/TaskOverlayFactory;Lcom/android/launcher3/util/y2$a;)V
    .locals 10

    .line 1
    const-string v0, "primaryTask"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "secondaryTask"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "orientedState"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "taskOverlayFactory"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->cancelPendingLoadTasks()V

    .line 22
    .line 23
    .line 24
    const v7, 0x7f0b0214

    .line 25
    .line 26
    .line 27
    const/4 v8, 0x0

    .line 28
    const v3, 0x7f0b0565

    .line 29
    .line 30
    .line 31
    const v4, 0x7f0b02fc

    .line 32
    .line 33
    .line 34
    const v5, 0x7f0b03c6

    .line 35
    .line 36
    .line 37
    const v6, 0x7f0b0556

    .line 38
    .line 39
    .line 40
    move-object v1, p0

    .line 41
    move-object v2, p1

    .line 42
    move-object v9, p4

    .line 43
    invoke-virtual/range {v1 .. v9}, Lcom/android/quickstep/views/TaskView;->createTaskContainer(Lcom/android/systemui/shared/recents/model/Task;IIIIIILcom/android/quickstep/TaskOverlayFactory;)Lcom/android/quickstep/views/TaskContainer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    move-object v0, v1

    .line 48
    move-object v8, v9

    .line 49
    const v6, 0x7f0b010f

    .line 50
    .line 51
    .line 52
    const/4 v7, 0x1

    .line 53
    const v2, 0x7f0b011c

    .line 54
    .line 55
    .line 56
    const v3, 0x7f0b0110

    .line 57
    .line 58
    .line 59
    const v4, 0x7f0b0111

    .line 60
    .line 61
    .line 62
    const v5, 0x7f0b0557

    .line 63
    .line 64
    .line 65
    move-object v1, p2

    .line 66
    invoke-virtual/range {v0 .. v8}, Lcom/android/quickstep/views/TaskView;->createTaskContainer(Lcom/android/systemui/shared/recents/model/Task;IIIIIILcom/android/quickstep/TaskOverlayFactory;)Lcom/android/quickstep/views/TaskContainer;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    filled-new-array {p0, p2}, [Lcom/android/quickstep/views/TaskContainer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/TaskView;->setTaskContainers(Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    iput-object p5, v0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_1

    .line 96
    .line 97
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    check-cast p2, Lcom/android/quickstep/views/TaskContainer;

    .line 102
    .line 103
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    if-eqz p2, :cond_0

    .line 108
    .line 109
    invoke-virtual {p2, p5}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setSplitBounds(Lcom/android/launcher3/util/y2$a;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    const-class p0, Lcom/android/quickstep/SplitActivity;

    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    const/4 p4, 0x0

    .line 124
    if-eqz p2, :cond_2

    .line 125
    .line 126
    invoke-virtual {p2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    goto :goto_1

    .line 131
    :cond_2
    move-object p2, p4

    .line 132
    :goto_1
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    iput-boolean p0, v0, Lcom/android/quickstep/views/GroupedTaskView;->isSecondSplitActivity:Z

    .line 137
    .line 138
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    if-eqz p0, :cond_3

    .line 143
    .line 144
    iget-object p2, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 145
    .line 146
    if-eqz p2, :cond_3

    .line 147
    .line 148
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    if-eqz p2, :cond_3

    .line 153
    .line 154
    iget-object p2, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 155
    .line 156
    if-eqz p2, :cond_3

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    if-eqz p2, :cond_3

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    invoke-virtual {p2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 173
    .line 174
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 175
    .line 176
    invoke-static {p1}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {v1}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 181
    .line 182
    .line 183
    move-result-object p4

    .line 184
    invoke-virtual {p4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p4

    .line 188
    iget-object p5, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 189
    .line 190
    iget p5, p5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 191
    .line 192
    invoke-static {p5}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 193
    .line 194
    .line 195
    move-result-object p5

    .line 196
    invoke-virtual {p0, p2, p1, p4, p5}, Lcom/android/launcher3/C2;->x2(Ljava/lang/String;Landroid/os/UserHandle;Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/model/data/I;

    .line 197
    .line 198
    .line 199
    move-result-object p4

    .line 200
    :cond_3
    invoke-virtual {v0, p4}, Lcom/android/quickstep/views/TaskView;->setMSplitScreenGroupShortcutsItem(Lcom/android/launcher3/model/data/I;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0, p3}, Lcom/android/quickstep/views/TaskView;->onBind(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method protected getLastSelectedChildTaskIndex()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isDismissingFromSplitPair()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getThisTaskCurrentlyInSplitSelection()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v2, -0x1

    .line 25
    if-eq v0, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getLeftTopTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 36
    .line 37
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 38
    .line 39
    if-ne v0, p0, :cond_0

    .line 40
    .line 41
    return v1

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Lcom/android/quickstep/views/TaskViewIcon;->asView()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v2, "asView(...)"

    .line 57
    .line 58
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getLastTouchDownPosition()Landroid/graphics/PointF;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-direct {p0, v0, v2}, Lcom/android/quickstep/views/GroupedTaskView;->containsPoint(Landroid/view/View;Landroid/graphics/PointF;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getLastTouchDownPosition()Landroid/graphics/PointF;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-direct {p0, v0, v2}, Lcom/android/quickstep/views/GroupedTaskView;->containsPoint(Landroid/view/View;Landroid/graphics/PointF;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->getLastSelectedChildTaskIndex()I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0

    .line 95
    :cond_3
    :goto_0
    return v1
.end method

.method public final getLeftTopTaskContainer()Lcom/android/quickstep/views/TaskContainer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 11
    .line 12
    return-object p0
.end method

.method public final getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 11
    .line 12
    return-object p0
.end method

.method public final getSnapPosition()I
    .locals 0
    .annotation runtime Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/y2$a;->h:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, -0x1

    .line 9
    return p0
.end method

.method public final getSplitBoundsConfig()Lcom/android/launcher3/util/y2$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final getTextWidth(Lcom/android/launcher3/h0;I)I
    .locals 2

    .line 1
    const-string v0, "deviceProfile"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/android/launcher3/X3;->g0:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getMSplitScreenGroupShortcutsItem()Lcom/android/launcher3/model/data/I;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->shouldInflateGridStyle()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget v0, p1, Lcom/android/launcher3/X3;->j0:I

    .line 21
    .line 22
    :goto_0
    sub-int/2addr v0, p2

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget v0, p1, Lcom/android/launcher3/X3;->i0:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    :goto_1
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-nez p2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget-object v1, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 38
    .line 39
    if-eq p2, v1, :cond_3

    .line 40
    .line 41
    :cond_2
    iget v0, p1, Lcom/android/launcher3/X3;->g0:I

    .line 42
    .line 43
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->isGridSingleTask()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_5

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getGRID_TO_SINGLE_DEFAULT_SCALE()F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    if-eqz p2, :cond_4

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getGridToSingleScale()F

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    :cond_4
    int-to-float p0, v0

    .line 71
    mul-float/2addr p0, p1

    .line 72
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0

    .line 77
    :cond_5
    return v0
.end method

.method public final ifTaskContainSplitActivity()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/GroupedTaskView;->isSecondSplitActivity:Z

    .line 2
    .line 3
    return p0
.end method

.method protected inflateViewStubs()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->inflateViewStubs()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b011c

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/ViewStub;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const v1, 0x7f0e0221

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const v1, 0x7f0e0222

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    :cond_1
    const v0, 0x7f0b0110

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/view/ViewStub;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    const v0, 0x7f0e0107

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const v0, 0x7f0e0108

    .line 56
    .line 57
    .line 58
    :goto_1
    invoke-virtual {p0, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 62
    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method public launchAsStaticTile()Lcom/android/launcher3/util/Y1;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v1, Lcom/android/launcher3/util/Y1;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 12
    .line 13
    .line 14
    const/16 v2, 0x31

    .line 15
    .line 16
    const-string v3, "Enter form GroupedTaskView"

    .line 17
    .line 18
    invoke-static {p0, v2, v3}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->begin(Landroid/view/View;ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Lcom/android/quickstep/views/n;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Lcom/android/quickstep/views/n;-><init>(Lcom/android/launcher3/util/Y1;)V

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, 0x1

    .line 28
    invoke-direct {p0, v3, v4, v2}, Lcom/android/quickstep/views/GroupedTaskView;->launchTaskInternal(ZZLu4/l;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 32
    .line 33
    .line 34
    return-object v1
.end method

.method public final launchTask(Lcom/android/systemui/shared/recents/model/Task;)Lcom/android/launcher3/util/Y1;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-interface {v1, p0, v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "getActivityLaunchOptions(...)"

    .line 13
    .line 14
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, v1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDisplay()Landroid/view/Display;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDisplay()Landroid/view/Display;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Landroid/view/Display;->getDisplayId()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    :goto_0
    invoke-virtual {v2, v3}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 43
    .line 44
    iget-object v4, v1, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 45
    .line 46
    invoke-virtual {v2, v3, v4}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->startActivityFromRecents(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/ActivityOptions;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_3

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/android/quickstep/TaskUtils;->getLaunchComponentKeyForTask(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)Lcom/android/launcher3/util/E;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p1, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v2, "launchTask: component: "

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v2, "GroupedTaskView"

    .line 90
    .line 91
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    if-eqz p1, :cond_1

    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Lh1/a;->K(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    sget-object p1, Lf1/a;->J:Lf1/a$a;

    .line 111
    .line 112
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_2

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskViewId()I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    const/4 v0, -0x1

    .line 123
    if-eq p1, v0, :cond_2

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->onTaskLaunchedInLiveTileMode()V

    .line 126
    .line 127
    .line 128
    new-instance p1, Lcom/android/launcher3/util/Y1;

    .line 129
    .line 130
    invoke-direct {p1}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 134
    .line 135
    .line 136
    return-object p1

    .line 137
    :cond_2
    iget-object p1, v1, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->addSideTaskLaunchCallback(Lcom/android/launcher3/util/Y1;)V

    .line 140
    .line 141
    .line 142
    iget-object p0, v1, Lcom/android/launcher3/util/b;->b:Lcom/android/launcher3/util/Y1;

    .line 143
    .line 144
    return-object p0

    .line 145
    :cond_3
    const-string p1, "launchGroupTask"

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView;->notifyTaskLaunchFailed(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    :cond_4
    return-object v0
.end method

.method public launchWithoutAnimation(ZLu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lu4/l<",
            "-",
            "Ljava/lang/Boolean;",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0, p2}, Lcom/android/quickstep/views/GroupedTaskView;->launchTaskInternal(ZZLu4/l;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected onMeasure(II)V
    .locals 10

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result v3

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    invoke-virtual {p0, v3, v4}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    .line 13
    .line 14
    .line 15
    iget-object v5, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 16
    .line 17
    if-nez v5, :cond_0

    .line 18
    .line 19
    goto/16 :goto_3

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget p1, p1, Lcom/android/launcher3/h0;->S2:I

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/RecentsView;->getThumbnailTopMargin(Lcom/android/launcher3/h0;)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    :cond_1
    move v9, p1

    .line 57
    invoke-direct {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getThisTaskCurrentlyInSplitSelection()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const/4 p2, -0x1

    .line 62
    const/4 v0, 0x0

    .line 63
    const/4 v1, 0x1

    .line 64
    if-eq p1, p2, :cond_2

    .line 65
    .line 66
    move p1, v0

    .line 67
    move v8, v1

    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move p1, v0

    .line 70
    move v8, p1

    .line 71
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getLeftTopTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    invoke-interface {v6}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    const-string v7, "getDeviceProfile(...)"

    .line 100
    .line 101
    invoke-static {v6, v7}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    if-ne v7, v1, :cond_3

    .line 109
    .line 110
    move v7, v1

    .line 111
    :goto_1
    move-object v1, p2

    .line 112
    goto :goto_2

    .line 113
    :cond_3
    move v7, p1

    .line 114
    goto :goto_1

    .line 115
    :goto_2
    invoke-interface/range {v0 .. v9}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->measureGroupedTaskViewThumbnailBounds(Landroid/view/View;Landroid/view/View;IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;ZZI)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-nez p1, :cond_4

    .line 123
    .line 124
    invoke-direct {p0}, Lcom/android/quickstep/views/GroupedTaskView;->updateIconPlacement()V

    .line 125
    .line 126
    .line 127
    :cond_4
    :goto_3
    return-void
.end method

.method public onRecycle()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/views/TaskView;->onRecycle()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 6
    .line 7
    return-void
.end method

.method public saveIconDrawable(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iput-object p2, p0, Lcom/android/quickstep/views/GroupedTaskView;->iconDrawable2:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/views/TaskView;->saveIconDrawable(Lcom/android/quickstep/views/TaskViewIcon;Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V
    .locals 7

    .line 1
    const-string v0, "orientationState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->L()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v0, v0, Lcom/android/launcher3/h0;->S2:I

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getThumbnailTopMargin(Lcom/android/launcher3/h0;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    :cond_0
    move v6, v0

    .line 48
    iget-object v3, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 49
    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v0, "getDeviceProfile(...)"

    .line 65
    .line 66
    invoke-static {v2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget v5, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 80
    .line 81
    invoke-interface/range {v1 .. v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const v2, 0x7f070b4c

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    const v3, 0x7f070b45

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    add-int/2addr v1, v2

    .line 108
    mul-int/lit8 v1, v1, 0x2

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getLeftTopTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    const-string v3, "null cannot be cast to non-null type com.android.quickstep.views.IconAppChipView"

    .line 119
    .line 120
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    check-cast v2, Lcom/android/quickstep/views/IconAppChipView;

    .line 124
    .line 125
    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v4, Landroid/graphics/Point;

    .line 128
    .line 129
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 130
    .line 131
    sub-int/2addr v4, v1

    .line 132
    invoke-virtual {v2, v4}, Lcom/android/quickstep/views/IconAppChipView;->setMaxWidth(I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->getRightBottomTaskContainer()Lcom/android/quickstep/views/TaskContainer;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    check-cast v2, Lcom/android/quickstep/views/IconAppChipView;

    .line 147
    .line 148
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast v0, Landroid/graphics/Point;

    .line 151
    .line 152
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 153
    .line 154
    sub-int/2addr v0, v1

    .line 155
    invoke-virtual {v2, v0}, Lcom/android/quickstep/views/IconAppChipView;->setMaxWidth(I)V

    .line 156
    .line 157
    .line 158
    :cond_1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/TaskView;->setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 159
    .line 160
    .line 161
    invoke-direct {p0}, Lcom/android/quickstep/views/GroupedTaskView;->updateIconPlacement()V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/android/quickstep/views/GroupedTaskView;->ifTaskContainSplitActivity()Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_2

    .line 169
    .line 170
    invoke-direct {p0}, Lcom/android/quickstep/views/GroupedTaskView;->updateSnapshotBackground()V

    .line 171
    .line 172
    .line 173
    :cond_2
    return-void
.end method

.method protected setPivot(IIII)V
    .locals 1

    .line 1
    sub-int/2addr p3, p1

    .line 2
    int-to-float p1, p3

    .line 3
    const/high16 p2, 0x3f000000    # 0.5f

    .line 4
    .line 5
    mul-float/2addr p1, p2

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p3, 0x0

    .line 14
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p1, p1

    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    check-cast p4, Lcom/android/quickstep/views/TaskContainer;

    .line 39
    .line 40
    invoke-virtual {p4}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 41
    .line 42
    .line 43
    move-result-object p4

    .line 44
    if-eqz p4, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p4

    .line 54
    check-cast p4, Lcom/android/quickstep/views/TaskContainer;

    .line 55
    .line 56
    invoke-virtual {p4}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 57
    .line 58
    .line 59
    move-result-object p4

    .line 60
    invoke-virtual {p4}, Landroid/view/View;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result p4

    .line 64
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    check-cast p3, Lcom/android/quickstep/views/TaskContainer;

    .line 73
    .line 74
    invoke-virtual {p3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    add-int/2addr p4, p3

    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    check-cast p3, Lcom/android/quickstep/views/TaskContainer;

    .line 93
    .line 94
    invoke-virtual {p3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 99
    .line 100
    .line 101
    move-result p4

    .line 102
    :goto_0
    int-to-float p3, p4

    .line 103
    mul-float/2addr p3, p2

    .line 104
    add-float/2addr p1, p3

    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public setTitleAlpha(F)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTitleAlpha(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getMSplitScreenGroupShortcutsItem()Lcom/android/launcher3/model/data/I;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Lcom/android/quickstep/views/IconView;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "null cannot be cast to non-null type com.android.quickstep.views.IconView"

    .line 44
    .line 45
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    check-cast v0, Lcom/android/quickstep/views/IconView;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public setTitleHidden(Z)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/TaskView;->setTitleHidden(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getMSplitScreenGroupShortcutsItem()Lcom/android/launcher3/model/data/I;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/16 v0, 0x8

    .line 61
    .line 62
    invoke-interface {p1, v0}, Lcom/android/quickstep/views/TaskViewIcon;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/views/GroupedTaskView;->iconDrawable2:Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p1, v0}, Lcom/android/quickstep/views/TaskViewIcon;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lcom/android/quickstep/views/TaskContainer;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskContainer;->getIconView()Lcom/android/quickstep/views/TaskViewIcon;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iget-object v2, p0, Lcom/android/quickstep/views/GroupedTaskView;->iconDrawable2:Landroid/graphics/drawable/Drawable;

    .line 122
    .line 123
    invoke-interface {p1, v2}, Lcom/android/quickstep/views/TaskViewIcon;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTitleView()Landroid/widget/TextView;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    if-eqz p0, :cond_3

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 143
    .line 144
    .line 145
    :cond_3
    :goto_0
    return-void
.end method

.method public final updateSplitBoundsConfig(Lcom/android/launcher3/util/y2$a;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/quickstep/views/TaskContainer;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/quickstep/views/GroupedTaskView;->splitBoundsConfig:Lcom/android/launcher3/util/y2$a;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setSplitBounds(Lcom/android/launcher3/util/y2$a;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getDigitalWellBeingToast()Lcom/android/quickstep/views/DigitalWellBeingToast;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->initialize()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
