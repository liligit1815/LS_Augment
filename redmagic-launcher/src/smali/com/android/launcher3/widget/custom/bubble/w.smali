.class public final synthetic Lcom/android/launcher3/widget/custom/bubble/w;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

.field public final synthetic h:J

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;JLjava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/w;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/android/launcher3/widget/custom/bubble/w;->h:J

    .line 7
    .line 8
    iput-object p4, p0, Lcom/android/launcher3/widget/custom/bubble/w;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/android/launcher3/widget/custom/bubble/w;->j:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-object p6, p0, Lcom/android/launcher3/widget/custom/bubble/w;->k:Landroid/content/Context;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/w;->g:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/android/launcher3/widget/custom/bubble/w;->h:J

    .line 4
    .line 5
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/w;->i:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/w;->j:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object v5, p0, Lcom/android/launcher3/widget/custom/bubble/w;->k:Landroid/content/Context;

    .line 10
    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;->f(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;JLjava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
