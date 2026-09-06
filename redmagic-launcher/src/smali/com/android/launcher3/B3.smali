.class public final synthetic Lcom/android/launcher3/B3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/model/data/I;

.field public final synthetic b:Landroid/content/pm/ShortcutInfo;

.field public final synthetic c:Lcom/android/launcher3/D3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/B3;->a:Lcom/android/launcher3/model/data/I;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/B3;->b:Landroid/content/pm/ShortcutInfo;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/B3;->c:Lcom/android/launcher3/D3;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/B3;->a:Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/B3;->b:Landroid/content/pm/ShortcutInfo;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/B3;->c:Lcom/android/launcher3/D3;

    .line 6
    .line 7
    move-object v3, p1

    .line 8
    move-object v4, p2

    .line 9
    move-object v5, p3

    .line 10
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/D3;->l(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/D3;Lz1/o3;Lz1/y0;Lz1/m;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
