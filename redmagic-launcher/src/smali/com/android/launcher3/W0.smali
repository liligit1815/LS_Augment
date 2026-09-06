.class public final synthetic Lcom/android/launcher3/W0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/X0;

.field public final synthetic h:Z

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Lcom/android/launcher3/BubbleTextView;

.field public final synthetic k:Lcom/android/launcher3/model/data/I;

.field public final synthetic l:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/X0;ZLjava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/W0;->g:Lcom/android/launcher3/X0;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/W0;->h:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/W0;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/W0;->j:Lcom/android/launcher3/BubbleTextView;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/W0;->k:Lcom/android/launcher3/model/data/I;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/W0;->l:Landroid/content/Context;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/W0;->g:Lcom/android/launcher3/X0;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/W0;->h:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/W0;->i:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/W0;->j:Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/launcher3/W0;->k:Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/W0;->l:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/X0;->c(Lcom/android/launcher3/X0;ZLjava/lang/String;Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/I;Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
