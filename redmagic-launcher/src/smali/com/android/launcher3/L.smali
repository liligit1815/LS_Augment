.class public final synthetic Lcom/android/launcher3/L;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/BubbleTextView;

.field public final synthetic h:Lcom/android/launcher3/model/data/z;

.field public final synthetic i:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/L;->g:Lcom/android/launcher3/BubbleTextView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/L;->h:Lcom/android/launcher3/model/data/z;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/L;->i:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/L;->g:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/L;->h:Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/L;->i:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/BubbleTextView;->c(Lcom/android/launcher3/BubbleTextView;Lcom/android/launcher3/model/data/z;Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
