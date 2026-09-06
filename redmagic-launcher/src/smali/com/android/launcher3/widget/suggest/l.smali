.class public final synthetic Lcom/android/launcher3/widget/suggest/l;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

.field public final synthetic h:Lcom/android/launcher3/model/data/d;

.field public final synthetic i:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;Lcom/android/launcher3/model/data/d;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/suggest/l;->g:Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/suggest/l;->h:Lcom/android/launcher3/model/data/d;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/android/launcher3/widget/suggest/l;->i:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/suggest/l;->g:Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/suggest/l;->h:Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/widget/suggest/l;->i:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/widget/suggest/m;->c0(Lcom/android/launcher3/widget/suggest/SuggestBubbleTextView;Lcom/android/launcher3/model/data/d;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
