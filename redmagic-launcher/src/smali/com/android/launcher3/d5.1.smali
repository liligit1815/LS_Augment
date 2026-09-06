.class public final synthetic Lcom/android/launcher3/d5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/C2;

.field public final synthetic h:Lcom/android/launcher3/Workspace;

.field public final synthetic i:Lcom/android/launcher3/Hotseat;

.field public final synthetic j:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

.field public final synthetic k:Lcom/android/launcher3/LongClickTextView;

.field public final synthetic l:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/d5;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/d5;->h:Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/d5;->i:Lcom/android/launcher3/Hotseat;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/d5;->j:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/d5;->k:Lcom/android/launcher3/LongClickTextView;

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/android/launcher3/d5;->l:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/d5;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/d5;->h:Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/d5;->i:Lcom/android/launcher3/Hotseat;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/d5;->j:Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/launcher3/d5;->k:Lcom/android/launcher3/LongClickTextView;

    .line 10
    .line 11
    iget-boolean v5, p0, Lcom/android/launcher3/d5;->l:Z

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/q5;->a(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;Lcom/android/launcher3/Hotseat;Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;Lcom/android/launcher3/LongClickTextView;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
